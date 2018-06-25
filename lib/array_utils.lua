--[[

  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 10:23 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/lib/array_utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/lib/array_utils.lua

]]--

function contains(array, object)
	if (array == nil) then
		return false
	end
	for i = 1, #array do
		if (array[i] == object) then
			return true
		end
	end
	return false
end