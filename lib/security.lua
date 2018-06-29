--[[

  Author: Panzer1119
  
  Date: Edited 29 Jun 2018 - 10:36 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/lib/security.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/lib/security.lua

]]--

os.loadAPI("lib/utils.lua")

timeMultiplier = 40

function getFlooredTime()
	return math.floor(os.time() * timeMultiplier)
end

function genNormalMult()
    math.randomseed(os.clock()^5)
	return math.abs(math.random(30000000000, 100000000000))
end

function genNormalMod()
    math.randomseed(os.clock()^5)
	return math.abs(math.random(300000, 1000000))
end

function gen2FACode(mult, mod)
	return ((getFlooredTime() * mult) % mod)
end