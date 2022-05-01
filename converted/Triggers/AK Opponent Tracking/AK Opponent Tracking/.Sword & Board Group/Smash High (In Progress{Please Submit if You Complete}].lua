if ak.ai() then return end
boardaffs = boardaffs or {}
if IsTargetted(matches[2]) then
   table.insert(boardaffs, "HIGH")
end
enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
