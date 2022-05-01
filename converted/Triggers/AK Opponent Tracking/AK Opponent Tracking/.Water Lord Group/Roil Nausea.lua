if ak.ai() then return end
if IsTargetted(matches[2]) then
  if affstrack.score.nausea > 0 then
		ak.thoughtIhad("nausea") 
	end
	OppGainedAff("nausea")
	ak.fluxcheck = "roil"
	ak.fluxline = matches[1]
	enableTrigger("Flux Enhance")
end
