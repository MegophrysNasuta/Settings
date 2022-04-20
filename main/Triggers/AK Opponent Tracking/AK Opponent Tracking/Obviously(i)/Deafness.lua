if ak.ai() then return end
if IsTargetted(multimatches[2][2]) then   
   affstrack.score.deaf = 100
   tempTimer(5,[[affstrack.score.deaf = 0;ak.scoreup(]]..multimatches[2][2]..[[)]])
end
