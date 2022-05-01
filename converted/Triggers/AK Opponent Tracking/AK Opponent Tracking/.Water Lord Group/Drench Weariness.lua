if ak.ai() then return end
if IsTargetted(matches[2]) then
  if affstrack.score.weariness > 0 then
		ak.thoughtIhad("weariness") 
	end
	OppGainedAff("weariness")
	ak.fluxline = matches[1]
	ak.fluxcheck = "drench"
	enableTrigger("Flux Enhance")
end
