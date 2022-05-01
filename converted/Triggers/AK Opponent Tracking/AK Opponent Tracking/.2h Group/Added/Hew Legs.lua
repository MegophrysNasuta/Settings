if IsTargetted(matches[2]) then
	ak.twoh.tendons = ak.twoh.tendons + ak.twoh.modifier
	if ak.twoh.tendons > 7 then ak.twoh.tendons = 7 end
	cecho("<yellow>tendons:<cyan> "..ak.twoh.tendons)
	ak.tendonHit()
end
