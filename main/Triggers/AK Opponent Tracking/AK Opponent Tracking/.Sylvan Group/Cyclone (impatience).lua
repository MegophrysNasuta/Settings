if IsTargetted(matches[2]) then
	affstrack.score.dizziness = 100
	OppGainedAff("impatience")
	if affstrack.overcharge == true then
		OppGainedAff("asthma")
	end
end

