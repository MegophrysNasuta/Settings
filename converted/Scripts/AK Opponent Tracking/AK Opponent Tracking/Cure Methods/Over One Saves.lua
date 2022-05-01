ak.excess = ak.excess or {}
function ak.DumpExcess(affliction)
	local stored = math.floor(affstrack.score[affliction]/100)
	stored = stored * 100
	if stored > 0 then
		ak.excess[affliction] = stored
	end
	affstrack.score[affliction] = affstrack.score[affliction] - stored
end

function ak.RestoreExcess(affliction)
	if ak.excess[affliction] then
		affstrack.score[affliction] = affstrack.score[affliction] + ak.excess[affliction]
	end
end


