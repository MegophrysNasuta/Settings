if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if affstrack.score.weariness>0 and affstrack.score.recklessness>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("weariness") else affstrack.score.weariness = 0 end
   end
   affstrack.score.weariness = 0
   affstrack.score.recklessness = 0
	 if affstrack.score.prone == 100 then
	 ak.cure.passive()
	 else
   ak.cure.passive()
   ak.cure.passive()
   ak.cure.passive() 
	 ak.resetbacktrack()
	 end
end
