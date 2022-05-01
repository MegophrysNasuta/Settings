if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   OppGainedAff("scalded")
   if ak.scaldTimer then killTimer(ak.scaldTimer) end
   ak.scaldTimer = tempTimer(17,[[
   	affstrack.score.scalded = 0
   	ak.scoreup(]]..matches[2]..[[)
   ]])
end
