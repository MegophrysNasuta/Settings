if ak.ai() then return end
if IsTargetted(matches[2]) then
   ak.currentmana = ak.currentmana - 100
   affstrack.score.insomnia = 0
   ak.scoreup(matches[2])
end
