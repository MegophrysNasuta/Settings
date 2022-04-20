if ak.ai() then return end

if ak.limbs.shikudoParse then
  ak.limbs.shikudoParse()
end

if not IsTargetted(matches[2]) then return end
if matches[3] == "skin" and not ak.defs.mass then 
   ak.defs.mass = true
	 ak.bals.salve = true
   cecho("<cyan>Mass Consideration Removed") 
elseif ak.bals.salve then
	if affstrack.score.aeon == 100 and affstrack.score.slickness == 100 then
	   return
	else 
	   affstrack.score.tempslickness= 0
	   ak.bals.salve = false
	   if affstrack.score.slickness>0 then 
	      if ak.thoughtIhad then 
					ak.thoughtIhad("slickness") 
				else 
					affstrack.score.slickness = 0 
				end  
	   end
	   ak.cure.apply(matches[3]) 		
		 if ak.timers.apply then			
		 	killTimer(ak.timers.apply)		
		 end
	   ak.timers.apply = tempTimer(.8,[[ak.bals.salve = true;ak.timers.apply = false]])
	   --cecho("<cyan>Processed Cures")
	end
else
	if ak.timers.apply then 
		ak.bals.salve = true
		cecho("<cyan>Ignored Cures")
	end
end

