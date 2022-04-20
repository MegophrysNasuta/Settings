if IsTargetted(matches[2]) and affstrack.score.haemophilia > 0 then 	
	local bleedr = ak.bleedincrease or 65
	ak.bleeding = ak.bleeding + bleedr
	cecho(ak.bleeding)
	ak.scoreup(matches[2])
end
