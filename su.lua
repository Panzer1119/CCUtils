--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 08:38 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/su.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/blob/master/su.lua

]]--

charset_reverse = {}  do 
	for c = 48, 57  do charset_reverse[string.char(c)]=c end
	for c = 65, 90  do charset_reverse[string.char(c)]=c end
	for c = 97, 122 do charset_reverse[string.char(c)]=c end
end

function isEmpty(s)
  return s == nil or s == ''
end

function findLast(haystack, needle)
    local i = haystack:match(".*"..needle.."()")
    if i == nil then return nil else return i-1 end
end

charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function randomString(length)
    if not length or length <= 0 then return '' end
	if length >= 245 then return nil end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

function sumString(text)
	if (text == nil) then
		return nil
	end
	local sum = 0
	for c in text:gmatch"." do
		sum = sum + charset_reverse[c]
	end
	return sum
end
