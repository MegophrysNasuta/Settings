if IsTargetted(matches[2]) then
   OppGainedAff("Asthma")
	 ak.limbs.LimbHit(matches[2], "Me", "psion", "head", "percent")
end
if IsTargetted(matches[2]) and affstrack.score.haemophilia > 0 then 
	local bleedr = 0	
	if affstrack.score.prone == 100 then
		bleedr = 160
	else
		bleedr = 75
	end
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[2])
end
-- LIMB HIT: head
