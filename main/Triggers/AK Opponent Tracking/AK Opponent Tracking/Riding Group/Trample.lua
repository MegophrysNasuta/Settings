if IsTargetted(matches[4]) then
local limbcheck = matches[2]..""..matches[3]
if affstrack.score[limbcheck] < 100 then
   affstrack.score[limbcheck] = 100
   ak.scoreup(matches[4])
end
end
