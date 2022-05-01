if ak.ai() then return end
if IsTargetted(matches[2]) then
	ak.ProTrackingConfirmed("nausea")
	ak.fluxcheck = "roil"
	ak.fluxline = matches[1]
	enableTrigger("Flux Enhance")
end
