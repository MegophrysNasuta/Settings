local num = matches[2]
local tar = matches[4]

if tar ~= nil then
  TargetCallTables.addTarget(num, tar)
else
  TargetCallTables.callTarget(num)
end
