--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 07:41 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/blob/master/utils.lua

]]--

os.loadAPI("su.lua")

function getRunningProgram()
  local name = getRunningProgramWithExtension()
  local index = su.findLast(name, "%.")
  if (index ~= nil and index > 0) then
	name = string.sub(name, 1, index - 1)
  end
  return name
end

function getRunningProgramWithExtension()
  local path = getRunningProgramWithPathAndExtension()
  local index = su.findLast(path, "%/")
  if (index ~= nil and index > 0) then
	path = string.sub(path, index + 1)
  end
  return path
end

function getRunningProgramWithPathAndExtension()
  return shell.getRunningProgram()
end
