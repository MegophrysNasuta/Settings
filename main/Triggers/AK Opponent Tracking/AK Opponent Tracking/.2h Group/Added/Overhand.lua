if IsTargetted(matches[2]) then
	ak.twoh.skull = ak.twoh.skull + ak.twoh.modifier
	if ak.twoh.skull > 7 then ak.twoh.skull = 7 end
	cecho("<yellow>skull:<cyan> "..ak.twoh.skull)
	ak.skullHit()
end
