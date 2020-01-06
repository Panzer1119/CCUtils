--[[

  Author: Panzer1119
  
  Date: Edited 10 Jul 2019 - 09:54 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/lib/time_utils.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/lib/time_utils.lua

]]--

hours_per_mc_day = 24
ticks_per_mc_hour = 1000
ticks_per_mc_day = hours_per_mc_day * ticks_per_mc_hour
tick_offset_midnight = 18 * ticks_per_mc_hour

function now()
	return toTimestamp(os.day(), os.time())
end

function toTimestamp(day_, time_)
	return day_ * ticks_per_mc_day + ((time_ * ticks_per_mc_hour + tick_offset_midnight) % ticks_per_mc_day)
end

function fromTimestamp(timestamp)
	local day_ = math.floor(timestamp  /ticks_per_mc_day) -- timestamp // ticks_per_mc_day
	local time_mc_ticks = timestamp % ticks_per_mc_day
	local time_ = ((time_mc_ticks - tick_offset_midnight + ticks_per_mc_day) % ticks_per_mc_day) / ticks_per_mc_hour
	return day_, time_
end