if ak.ai() then return end
if IsTargetted(matches[2]) then
   if affstrack.score.confusion > 0 then
      if ak.thoughtIhad then ak.thoughtIhad("confusion") else affstrack.score.confusion = 0 end
   end 
   affstrack.score.disrupt = 0
   ak.scoreup(matches[2])
end
