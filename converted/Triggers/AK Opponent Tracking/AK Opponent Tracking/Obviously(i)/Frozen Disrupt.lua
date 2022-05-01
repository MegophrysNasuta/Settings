if ak.ai() then return end
if IsTargetted(matches[2]) then
   affstrack.score.disrupt = 100
   if affstrack.score.frozen < 100 then affstrack.score.frozen = 100 end
   ak.scoreup(matches[2])
end
