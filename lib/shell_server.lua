--[[
  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 07:37 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/shell_server.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/shell_server.lua
]]--

os.loadAPI("lib/utils.lua")

whitelist = {}
blacklist = {}

file_name_whitelist = "shell_server/whitelist.lon"
file_name_blacklist = "shell_server/blacklist.lon"

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