if IsTargetted(matches[2]) then
	 if ak.ai() then return end
   local limbt = ak.limbs.standardizeLimb(matches[3]) 
   affstrack.score[limbt] = 300
   ak.scoreup(matches[2])
end
