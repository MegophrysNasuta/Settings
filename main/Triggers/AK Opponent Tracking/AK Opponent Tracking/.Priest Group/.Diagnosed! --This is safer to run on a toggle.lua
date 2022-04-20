if IsTargetted(matches[2]) then
   for k,v in pairs(affstrack.score) do
      if v > 1 then
         affstrack.score[k] = 0
      end
   end
   diagblind = false
   diagdeaf = false
   enableTrigger("Diagnose Triggers")
end
