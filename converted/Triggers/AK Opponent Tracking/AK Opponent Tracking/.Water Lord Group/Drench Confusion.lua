if ak.ai() then return end
if IsTargetted(matches[2]) then
	ak.ProTrackingConfirmed("weariness")
	OppGainedAff("confusion")
end
ak.fluxline = matches[1]
ak.fluxcheck = "drench"
enableTrigger("Flux Enhance")	
