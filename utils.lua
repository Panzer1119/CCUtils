--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 07:38 PM
  
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
  return shell.getRunningProgram()
end
