--[[
  Author: Panzer1119
  
  Date: Edited 26 Jun 2018 - 02:37 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/shell_server.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/shell_server.lua
]]--

os.loadAPI("lib/utils.lua")
os.loadAPI("lib/rednet_utils.lua")

args = {...}

protocol = "ss"
hostname = "shell_server"

whitelist = {programs = {}, computers = {}}
blacklist = {programs = {}, computers = {}}

file_name_whitelist = "shell_server/whitelist.lon"
file_name_blacklist = "shell_server/blacklist.lon"

--[[

Example whitelist file:

###########

{
	programs = {"id"},
	computers = {
					{
						id = 1,
						programs = {"mkdir"}
					},
					{
						id = 2,
						programs = {"ls"}
					}
				}
}

###########



Example blacklist file:

###########

{
	programs = {"exec", "lua"},
	computers = {
					{
						id = 3,
						programs = {"mkdir", "ls"}
					},
					{
						id = 5,
						programs = {}
					}
	
				}
}


###########


]]--

function reloadLists()
	if (fs.exists(file_name_whitelist)) then
		whitelist = textutils.unserialise(utils.readAllFromFile(file_name_whitelist))
	else
		whitelist = {programs_whitelist = {}, programs_blacklist = {}, computers = {}}
	end
	if (fs.exists(file_name_blacklist)) then
		blacklist = textutils.unserialise(utils.readAllFromFile(file_name_blacklist))
	else
		blacklist = {}
	end
end

function getId(entry)
	if (entry ~= nil) then
		return entry.id
	else
		return nil
	end
end

function input(sid, msg, ptc)
	local program = msg.program
	local arguments = msg.arguments
	local computer_whitelist = utils.getTableFromArray(whitelist, sid, getId)
	local computer_blacklist = utils.getTableFromArray(blacklist, sid, getId)
	local isOnGlobalBlacklist = (blacklist == nil or blacklist.programs == nil or #blacklist.programs == 0) and false or utils.arrayContains(blacklist.programs, program)
	local isOnGlobalWhitelist = (whitelist == nil or whitelist.programs == nil or #whitelist.programs == 0) and true or utils.arrayContains(whitelist.programs, program)
	local isOnLocalBlacklist = (computer_blacklist == nil or computer_blacklist.programs == nil or #computer_blacklist.programs == 0) and false or utils.arrayContains(computer_blacklist.programs, program)
	local isOnLocalWhitelist = (computer_whitelist == nil or computer_whitelist.programs == nil or #computer_whitelist.programs == 0) and true or utils.arrayContains(computer_whitelist.programs, program)
	if (not isOnLocalBlacklist and (isOnLocalWhitelist or (not isOnGlobalBlacklist and isOnGlobalWhitelist))) then
		shell.run(program .. " " .. arguments)
	else
		rednet.send(sid, "Program is blocked for you", ptc)
	end
end

reloadLists()

if (#args >= 1 and args[1] ~= nil) then
	protocol = args[1]
	if (#args >= 2 and args[2] ~= nil) then
		hostname = args[2]
	end
end

local side_modem = rednet_utils.openFirstModemFound()

rednet.host(protocol, hostname)

while true do
	local sid, msg, ptc = rednet.receive(protocol)
	if ((#blacklist == 0 or not utils.arrayContains(blacklist, sid)) and (#whitelist == 0 or utils.tableArrayContains(whitelist, sid, getId))) then
		pcall(input, sid, msg, ptc)
	else
		rednet.send(sid, "Access denied", ptc)
	end
end

rednet.unhost(protocol, hostname)

if (side_modem ~= nil) then
	rednet.close(side_modem)
end