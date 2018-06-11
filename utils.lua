--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 07:28 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/blob/master/utils.lua

]]--

os.loadAPI("su.lua")

function getRunningProgram()
  local name = getRunningProgramWithExtension()
  local lastIndex = 0
  local index = su.findLast(name, ".")
  print(index)
  return name
end

function getRunningProgramWithExtension()
  return shell.getRunningProgram()
end

getRunningProgram()
