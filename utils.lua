--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 07:52 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/blob/master/utils.lua

]]--

os.loadAPI("libs/su.lua")

function getRunningProgram(shell)
  local name = getRunningProgramWithExtension(shell)
  local index = su.findLast(name, "%.")
  if (index ~= nil and index > 0) then
	name = string.sub(name, 1, index - 1)
  end
  return name
end

function getRunningProgramWithExtension(shell)
  local path = getRunningProgramWithPathAndExtension(shell)
  local index = su.findLast(path, "%/")
  if (index ~= nil and index > 0) then
	path = string.sub(path, index + 1)
  end
  return path
end

function getRunningProgramWithPathAndExtension(shell)
  return shell.getRunningProgram()
end

function exit()
	error()
end

function get2FAosTime1s()  --changes every ~1 second
	return get2FAosTime(3)
end

function get2FAosTime5s()  --changes every ~5 second
	return get2FAosTime(2)
end

function get2FAosTime(exponent)
	return math.ceil(os.time() * math.pow(10, exponent))
end

function get2FAseed(salt)
	return get2FAosTime(0.75) * su.sumString(salt)
end
