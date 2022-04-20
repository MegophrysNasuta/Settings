if IsTargetted(matches[3]) then
	 local smashlimb = matches[2].."arm"
   OppGainedAff("Clumsiness")
	 ak.limbs.LimbHit(matches[3], "Me", "psion", smashlimb, "percent")
end
if IsTargetted(matches[3]) and affstrack.score.haemophilia > 0 then 	
	local bleedr = 45
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[3])
end
-- LIMB HIT: arm
