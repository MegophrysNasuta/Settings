if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
if fluxtimer then killTimer(fluxtimer);fluxtimer = nil end
OppGainedAff("timeflux")
fluxtimer = tempTimer(65, [[OppLostAff("timeflux")]])
end
