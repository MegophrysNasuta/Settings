if ak.ai() then return end
if IsTargetted(matches[2]) then	
	if matches[3] ~= "an allergy to sunlight" then
		OppGainedAff(matches[3])
	else 
		OppGainedAff("darkshade")
	end
end
