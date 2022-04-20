if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if affstrack.score.haemophilia>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("haemophilia") else affstrack.score.haemophilia = 0 end
   end
   ak.cure.passive()
end
