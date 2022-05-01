if ak.ai() then return end
if IsTargetted(matches[2]) then
	--cecho("<cyan>Flux: <white>"..ak.fluxcheck)
	if affstrack.score.asthma ~= 100 then
		ak.ProTrackingConfirmed("asthma")
		affstrack.score.slickness = 100
		affstrack.score.anorexia = 100
		ak.scoreup(matches[2])
	elseif affstrack.score.slickness ~= 100 then
		ak.ProTrackingConfirmed("slickness")
		affstrack.score.anorexia = 100
		ak.scoreup(matches[2])
	else
	  ak.ProTrackingConfirmed("anorexia")
	end
end
disableTrigger("Flux Enhance")
