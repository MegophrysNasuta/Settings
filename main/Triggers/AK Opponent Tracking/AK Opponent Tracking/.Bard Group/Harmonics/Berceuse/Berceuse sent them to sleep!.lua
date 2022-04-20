if multimatches[1][2]:lower() == target:lower() then
	if affstrack.score.prone < 100 then
		OppGainedAff("prone sleep")
	else
		OppGainedAff("sleep")
	end
end
