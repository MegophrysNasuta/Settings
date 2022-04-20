if ak.ai() then return end
if IsTargetted(matches[2]) and nextmoon and nextmoon ~= "DOPPLEGANGER" then
   OppGainedAff(nextmoon)
else
	ak.occie.aura.mental = ak.occie.aura.mental + 1
end
