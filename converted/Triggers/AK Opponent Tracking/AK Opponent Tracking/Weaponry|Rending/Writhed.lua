if ak.ai() then return end
if matches[2] and IsTargetted(matches[2]) then
   affstrack.impale = false
   ak.scoreup(matches[2])
elseif not matches[2] then
   affstrack.impale = false
   ak.scoreup(target)
end
