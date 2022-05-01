if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if affstrack.score.weariness>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("weariness") else affstrack.score.weariness = 0 end 
   end
   ak.cure.passive()
end

