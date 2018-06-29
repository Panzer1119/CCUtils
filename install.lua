--[[
  Author: Panzer1119
  
  Date: Edited 29 Jun 2018 - 02:27 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/install.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/master/install.lua
]]--

args = {...}

filename_files = "downloads/files.lon"
print("Downloading " .. filename_files)
fs.delete(filename_files)
shell.run("wget https://raw.githubusercontent.com/Panzer1119/CCUtils/master/files.lon " .. filename_files)

local f = fs.open(filename_files, "r")
files = textutils.unserialise(f.readAll())
f.close()

overwrite = false
not_overwrite = false
clean = false
keep = false
no_error = false

if (#args >= 1) then
	if (args[1] == "yes" or args[2] == "yes" or args[3] == "yes") then
		overwrite = true
	elseif (args[1] == "no" or args[2] == "no" or args[3] == "no") then
		not_overwrite = true
	end
	if (args[2] == "clean" or args[1] == "clean" or args[3] == "clean") then
		clean = true
	elseif (args[2] == "keep" or args[1] == "keep" or args[3] == "keep") then
		keep = true
	end
	if (args[3] == "noerror" or args[2] == "noerror" or args[1] == "noerror") then
		no_error = true
	end
end

installed = true

for i = 1, #files do
	print("")
	local download = true
	local file = files[i]
	if (file == nil or file.name == nil or file.path == nil or file.url == nil) then
		print("Error with a file!")
	else
		if (fs.exists(file.path)) then
			local input = nil
			if (not overwrite and not not_overwrite) then
				download = false
				print(file.name .. " is already installed,")
				write("do you want to update it? (Y/n): ")
				input = read()
			end
			if ((overwrite or input == "Y") and not not_overwrite) then
				fs.delete(file.path)
				download = true
			end
		end
		if (download) then
			print("Downloading " .. file.name .. " to " .. file.path .. "...")
			shell.run("wget " .. file.url .. " " .. file.path)
			if not (fs.exists(file.path)) then
				installed = false
			end
		end
	end
end

if (installed) then
	local input = nil
	if (not clean and not keep) then
		print("")
		print("")
		print("Installation was successful, do you want to")
		print("delete the cache and installation files?")
		write("(the installation file can be used to update the library) (yes/n): ")
		input = read()
	end
	if ((clean or input == "yes") and not keep) then
		fs.delete(filename_files)
		fs.delete(shell.getRunningProgram())
	end
elseif (not no_error) then
	print("")
	print("")
	print("Some files failed and could not be installed,")
	write("do you want to try it again? (yes/n): ")
	local input = read()
	if (input == "yes") then
		if (overwrite) then
			shell.run(shell.getRunningProgram() .. " yes")
		else
			shell.run(shell.getRunningProgram())
		end
	end
end