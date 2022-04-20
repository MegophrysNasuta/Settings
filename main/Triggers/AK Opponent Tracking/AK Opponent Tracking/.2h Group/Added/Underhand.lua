if IsTargetted(matches[2]) then
	ak.twoh.ribs = ak.twoh.ribs + ak.twoh.modifier
	if ak.twoh.ribs > 7 then ak.twoh.ribs = 7 end
	cecho("<yellow>ribs:<cyan> "..ak.twoh.ribs)
	ak.ribHit()
end
