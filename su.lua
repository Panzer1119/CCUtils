--[[

  Author: Panzer1119
  
  Date: Edited 11 Jun 2018 - 07:27 PM
  
  Original Source: https://github.com/Panzer1119/CCUtils/blob/master/su.lua
  
  Direct Download: https://raw.githubusercontent.com/Panzer1119/CCUtils/blob/master/su.lua

]]--

function isEmpty(s)
  return s == nil or s == ''
end

function findLast(haystack, needle)
    local i = haystack:match(".*"..needle.."()")
    if i == nil then return nil else return i-1 end
end
