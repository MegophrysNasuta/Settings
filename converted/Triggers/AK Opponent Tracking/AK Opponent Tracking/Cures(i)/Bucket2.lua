if ak.ai() then return end
if IsTargetted(matches[2]) then
   if affstrack.score.aflame == 100 then
      affstrack.score.aflame = 0
      ak.scoreup(matches[2])
   end
end
