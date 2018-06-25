--[[

  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 08:38 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/lib/rednet_utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/lib/rednet_utils.lua

]]--

os.loadAPI("lib/utils.lua")

function getModemSides()
	local sides = {}
	local counter = 1
	for i = 1, #utils.sides do
		if (peripheral.isPresent(utils.sides[i])) then
			sides[counter] = utils.sides[i]
			counter = counter + 1
		end
	end
	if (#sides == 0) then
		return nil
	else
		return sides
	end
end