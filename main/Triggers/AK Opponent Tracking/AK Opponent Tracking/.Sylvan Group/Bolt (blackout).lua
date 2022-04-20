if IsTargetted(matches[2]) then
   OppGainedAff("blackout")
   tempTimer(4,[[affstrack.score.blackout = 0;ak.scoreup(]]..matches[2]..[[)]])
	if affstrack.overcharge == true then
		OppGainedAff("paralysis")
	end
end
