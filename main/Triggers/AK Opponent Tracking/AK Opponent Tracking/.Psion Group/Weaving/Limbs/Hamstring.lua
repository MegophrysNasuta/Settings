if IsTargetted(matches[3]) then
  local smashlimb = matches[2].."leg"
	ak.limbs.LimbHit(matches[3], "Me", "psion", smashlimb, "percent")
  if affstrack.score[smashlimb] < 100 then
		OppGainedAff(smashlimb)
  end
	if IsTargetted(matches[3]) and affstrack.score.haemophilia > 0 then 	
		local bleedr = 55
		ak.bleeding = ak.bleeding + bleedr
		cecho(ak.bleeding)
		ak.scoreup(matches[3])
	end
end


      
-- LIMB HIT: leg
