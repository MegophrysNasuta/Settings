if ak.ai() then return end
if IsTargetted(matches[2]) then
   affstrack.score.blind = 100
   affstrack.score.deaf = 100
   ak.scoreup(matches[2])
end