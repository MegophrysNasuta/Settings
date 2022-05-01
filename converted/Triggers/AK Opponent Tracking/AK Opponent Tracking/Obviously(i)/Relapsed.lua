if ak.ai() then return end
if IsTargetted(matches[2]) then 
	if ak.ProTrackingConfirmed then 
	   ak.ProTrackingConfirmed("scytherus") 
	else 
	   affstrack.score.scytherus = 100
	   ak.scoreup(matches[2])
	end
end
