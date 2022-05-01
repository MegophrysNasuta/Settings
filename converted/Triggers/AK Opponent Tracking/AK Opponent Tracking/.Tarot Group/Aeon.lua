if ak.ai() then return end
if IsTargetted(matches[2]) then
   aeonreset = false
   OppGainedAff("aeon")
   AeonTimer = tempTimer(15,[[aeonreset = true]])
end
