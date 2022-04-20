if IsTargetted(matches[2]) then
   OppGainedAff("Stupidity")
   OppGainedAff("Dizziness")
	 ak.limbs.LimbHit(matches[2], "Me", "psion", "head", "percent")	
end
if IsTargetted(matches[2]) and affstrack.score.haemophilia > 0 then 	
	local bleedr = 15
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[2])
end
-- LIMB HIT: head
