if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
	EchoForMajorAff("PRONE")
	OppGainedAff("prone")
end
