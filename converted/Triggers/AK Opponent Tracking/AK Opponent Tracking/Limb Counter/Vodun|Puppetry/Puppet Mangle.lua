if IsTargetted(matches[3]) then
	 if ak.ai() then return end
   local limbt = ak.limbs.standardizeLimb(matches[2]) 
   if affstrack.score[limbt] > 0 then
	    affstrack.score[limbt] = 300
			ak.vodunmangled = true
			tempTimer(5,[[ak.vodunmangled = false]])
	 else
	    affstrack.score[limbt] = 200
	 end
   ak.scoreup(matches[3])
end
