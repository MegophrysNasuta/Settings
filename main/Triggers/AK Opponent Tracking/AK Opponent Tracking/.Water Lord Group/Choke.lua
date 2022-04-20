if ak.ai() then return end
if not IsTargetted(matches[2]) then
	return 
end
if affstrack.score.asthma == 100 then
	OppGainedAff("hallucinations")
else	
	OppGainedAff("asthma")
end
ak.pervasion.hitcount = ak.pervasion.hitcount + 1
ak.fluxline = matches[1]
ak.fluxcheck = "choke"
enableTrigger("Flux Enhance")	

