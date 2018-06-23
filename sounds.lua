--[[
  Author: Panzer1119
  
  Date: Edited 23 Jun 2018 - 06:36 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/sounds.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/sounds.lua
]]--

sounds = {}

function loadSounds(filename)
  local f = fs.open(filename, "r")
  sounds = textutils.unserialise(f.readAll())
  f.close()
end

function playSound(soundname, source, volume)
  shell.run("exec playSound " .. soundname .. " " .. source .. " @a ~ ~ ~ " .. volume)
end

function playContinousSound(soundname, source, volume)
  playSound(soundname, source, volume)
end
