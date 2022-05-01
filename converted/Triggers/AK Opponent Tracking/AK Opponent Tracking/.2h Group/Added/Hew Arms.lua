if IsTargetted(matches[3]) then
	ak.twoh.wrist = ak.twoh.wrist + ak.twoh.modifier
	if ak.twoh.wrist > 8 then ak.twoh.wrist = 8 end
	cecho("<yellow>wrist:<cyan> "..ak.twoh.wrist)
	ak.wristHit()
end
