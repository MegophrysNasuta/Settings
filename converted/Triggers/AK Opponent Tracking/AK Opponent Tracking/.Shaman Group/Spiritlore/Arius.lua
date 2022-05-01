if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) and affstrack.score.deaf == 100 then
	EchoForMajorAff("PRONE")
	OppGainedAff("prone disrupt")
end

