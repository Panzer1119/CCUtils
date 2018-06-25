--[[
  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 10:33 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/shell_server.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/shell_server.lua
]]--

os.loadAPI("lib/utils.lua")

args = {...}

protocol = "shell_server"

whitelist = {}
blacklist = {}

file_name_whitelist = "shell_server/whitelist.lon"
file_name_blacklist = "shell_server/blacklist.lon"

--[[

Example whitelist file:

###########

{
	{
		id = 1,
		programs_whitelist = {"id", "lua"},
		programs_blacklist = {"exec", "label"}
	},
	{
		id = 2,
		programs_whitelist = {"id"}
		programs_blacklist = {}
	}
}


###########


Example blacklist file:

###########

{
	3,
	4
}


###########


]]--

function reloadLists()
	if (fs.exists(file_name_whitelist)) then
		whitelist = textutils.unserialise(utils.readAllFromFile(file_name_whitelist))
	else
		whitelist = {}
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

reloadLists()

if (#args >= 1) then
	protocol = args[1]
end

rednet.host(protocol)

while true do
	local sid, msg, ptc = rednet.receive(protocol)
	if ((#blacklist == 0 or not utils.arrayContains(blacklist, sid)) and (#whitelist == 0 or utils.tableArrayContains(whitelist, sid, getId))) then
		
	end
end

rednet.unhost(protocol)