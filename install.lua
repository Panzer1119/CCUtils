--[[
  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 07:46 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/install.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/install.lua
]]--

filename_files = "downloads/files.lon"
wget  filename_files

local f = fs.open(filename_files, "r")