if ak.ai() then return end
if IsTargetted(matches[2]) then
	OppGainedAff("Lethargy")
end
ak.fluxline = matches[1]
ak.fluxcheck = "parch"
enableTrigger("Flux Enhance")
