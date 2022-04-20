if ak.ai() then return end
ocured.kelp = ocured.kelp or {}
ocured.treed = ocured.treed or {}
ocured.cureall = ocured.cureall or {}
if IsTargetted(matches[2]) then
   cecho("<cyan>Processed Cures")
   ocured.kelp.asthma = nil
   ocured.treed.asthma = nil
   ocured.cureall.asthma = nil
   if affstrack.score.weariness>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("weariness") else affstrack.score.weariness = 0 end 
   end
   affstrack.score.asthma = 0
   ak.scoreup(matches[2])
end

