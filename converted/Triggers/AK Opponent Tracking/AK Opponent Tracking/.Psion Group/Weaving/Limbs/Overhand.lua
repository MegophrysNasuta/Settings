if IsTargetted(matches[2]) then
	 ak.limbs.LimbHit(matches[2], "Me", "psion", "head", "percent")
	 if affstrack.score.prone == 100 then 
	 		OppGainedAff("Impatience") 
	 else 
	    OppGainedAff("Stupidity")
	 end	 
	 if affstrack.score.head > 0 then
	 		OppGainedAff("Impatience")
	 end
end
if IsTargetted(matches[2]) and affstrack.score.haemophilia > 0 then 	
	local bleedr = 15
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[2])
end

