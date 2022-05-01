local aff = "sensitivity"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	if affstrack.overcharge == true then
		OppGainedAff("paralysis")
	end
end


