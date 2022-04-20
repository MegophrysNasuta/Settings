if ak.ai() then return end
if IsTargetted(matches[2]) then   
   affstrack.score.blind = 100
   tempTimer(6,[[affstrack.score.blind = 0;ak.scoreup(]]..matches[2]..[[)]])
end
