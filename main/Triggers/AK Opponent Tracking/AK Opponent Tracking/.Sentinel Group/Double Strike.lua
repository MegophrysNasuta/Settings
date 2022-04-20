if IsTargetted(matches[2]) then
   if affstrack.score.impatience == 0 then 
      OppGainedAff("impatience")
   elseif affstrack.goldenscore > 1 or affstrack.score.impatience == 100 then
      OppGainedAff("epilepsy")
   end
end
