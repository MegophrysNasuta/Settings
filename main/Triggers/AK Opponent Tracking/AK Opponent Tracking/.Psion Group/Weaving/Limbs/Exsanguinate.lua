if IsTargetted(matches[2]) then
   OppGainedAff("Nausea")
	 if ak.bleeding >= 150 then
	 	OppGainedAff("Anorexia")
	 end
	 ak.limbs.LimbHit(matches[2], "Me", "psion", "torso", "percent")
end
if IsTargetted(matches[2]) and affstrack.score.haemophilia > 0 then 	
	local bleedr = 20
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[2])
end
-- LIMB HIT: torso
