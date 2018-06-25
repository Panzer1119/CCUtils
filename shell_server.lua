--[[
  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 08:23 PM
  
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

reloadLists()

if (#args >= 1) then
	protocol = args[1]
end

rednet.host(protocol)

while true do
	local sid, msg, ptc = rednet.receive(protocol)
end

rednet.unhost(protocol)