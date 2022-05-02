local targets = {}
local targetList = string.gsub(matches[1], "^st ", "")
for t in string.gmatch(targetList, "%w+") do
  if t ~= "and" then
    targets[#targets + 1] = t
  end
end

if #targets == 1 then
  target = targets[1]:lower():title()
  sendAll('st '.. targets[1], 'pt Target: '.. targets[1])
else
  TargetCallTables.setTargets(targets)
end
