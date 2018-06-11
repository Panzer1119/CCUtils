function getRunningProgram()
  local name = getRunningProgramWithExtension()
  local lastIndex = 0
  local index = string.find(name, ".")
  if (index != nil) then
    while (index != (index = string.find(name, ".", lastIndex))) do
      lastIndex = index[1]
    end
    name = string.sub(name, lastIndex)
  end
  return name
end

function getRunningProgramWithExtension()
  return shell.getRunningProgram()
end
