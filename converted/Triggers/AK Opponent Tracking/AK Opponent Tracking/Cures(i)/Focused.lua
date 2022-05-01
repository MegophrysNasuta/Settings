if ak.ai() then return end
if IsTargetted(matches[2]) then
	if ak.bals.focus then
		affstrack.score.rixil = 0
		ak.bals.focus = false
		ak.timers.focus = tempTimer(2.2,[[ak.bals.focus = true;ak.timers.focus = nil]])--2.2
		ak.cure.focus(matches[2])
	end
	ak.currentmana = ak.currentmana - 250
  affstrack.score.rixil = 0
  if not ak.timers.focus then 
     if not ak.bals.focus then  
         ak.bals.focus = true 
         cecho("<cyan>Ignored Cures")
         if ak.thoughtIhad then ak.thoughtIhad("impatience") else affstrack.score.impatience = 0 end
      end 
  end
  if affstrack.score.impatience>0 then
     if ak.thoughtIhad then ak.thoughtIhad("impatience") else affstrack.score.impatience = 0 end
     cecho("\n\n<yellow>IMPATIENCE CURED!!")
     cecho("\n\n<yellow>IMPATIENCE CURED!!")
     cecho("\n\n<yellow>IMPATIENCE CURED!!")
  end
end



