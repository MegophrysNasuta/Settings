if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if affstrack.score.paralysis>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("paralysis") else affstrack.score.paralysis = 0 end  
   end
   ak.cure.passive()
   ak.cure.passive() 
   ak.cure.passive() 
	 ak.resetbacktrack()
end
