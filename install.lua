--[[
  Author: Panzer1119
  
  Date: Edited 25 Jun 2018 - 07:58 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/install.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/install.lua
]]--

filename_files = "downloads/files.lon"
shell.run("wget https://raw.githubusercontent.com/Panzer1119/CCUtils/master/files.lon " .. filename_files)

local f = fs.open(filename_files, "r")
files = textutils.unserialise(f.readAll())
f.close()

for i = 1, #files do
	local file = files[i]
	print("Downloading " .. file.name .. " to " .. file.path .. "...")
	shell.run("wget " .. file.url .. " " .. file.path)
end