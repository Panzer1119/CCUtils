--[[

  Author: Panzer1119
  
  Date: Edited 26 Jun 2018 - 03:22 AM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/lib/utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/lib/utils.lua

]]--

os.loadAPI("lib/su.lua")

sides = {"top", "bottom", "left", "right", "back", "front"}

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

function clear(x, y)
	x = (x == nil) and 1 or x
	y = (y == nil) and 1 or y
	term.clear()
	term.setCursorPos(x, y)
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

function readAllFromFile(filename)
	if (fs.exists(filename)) then
		local f = fs.open(filename, "r")
		local all = f.readAll()
		f.close()
		return all
	else
		return nil
	end
end

function arrayContains(array, object)
	if (array == nil or #array == 0) then
		return false
	end
	for i = 1, #array do
		if (array[i] == object) then
			return true
		end
	end
	return false
end

function tableArrayContains(array, object, function_)
	filter = {startup = function_}
	if (array == nil or #array == 0) then
		return false
	end
	for i = 1, #array do
		if (filter.startup(array[i]) == object) then
			return true
		end
	end
	return false
end

function getTableFromArray(array, object, function_)
	filter = {startup = function_}
	if (array == nil or #array == 0) then
		return nil
	end
	for i = 1, #array do
		if (filter.startup(array[i]) == object) then
			return array[i]
		end
	end
	return nil
end