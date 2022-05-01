if ak.ai() then return end
if IsTargetted(matches[2]) then
	--cecho("<cyan>Flux: <white>"..ak.fluxcheck)
	if affstrack.score.nausea ~= 100 then
		ak.ProTrackingConfirmed("nausea")
		affstrack.score.weariness = 100
		ak.scoreup(matches[2])
	elseif affstrack.score.weariness ~= 100 then
		ak.ProTrackingConfirmed("weariness")
	end
end
disableTrigger("Flux Enhance")

