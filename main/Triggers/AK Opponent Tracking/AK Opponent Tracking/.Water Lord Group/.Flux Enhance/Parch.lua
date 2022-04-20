if ak.ai() then return end
if IsTargetted(matches[2]) then
	--cecho("<cyan>Flux: <white>"..ak.fluxcheck)
	if affstrack.score.haemophilia ~= 100 then
		ak.ProTrackingConfirmed("haemophilia")
		affstrack.score.weariness = 100
		ak.scoreup(matches[2])
	else
		ak.ProTrackingConfirmed("weariness")
	end
	OppGainedAff("addiction")
end
disableTrigger("Flux Enhance")
