if ak.ai() then return end
if IsTargetted(matches[2]) then
	if affstrack.score.paralysis ~= 100 then
		ak.ProTrackingConfirmed("paralysis")
		affstrack.score.paralysis = 100
		affstrack.score.slickness = 100
		affstrack.score.manaleech = 100
		ak.scoreup(matches[2])
	else
		affstrack.score.paralysis = 100
		affstrack.score.slickness = 100
		affstrack.score.manaleech = 100
		ak.scoreup(matches[2])
	end
end

	

