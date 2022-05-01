if ak.ai() then return end
boardaffs = boardaffs or {}
local aff = "paralysis"
if IsTargetted(matches[2])then
   table.insert(boardaffs, aff)
end
enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
