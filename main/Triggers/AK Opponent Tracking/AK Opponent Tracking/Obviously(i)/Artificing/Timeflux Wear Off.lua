if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   if fluxtimer then 
      killTimer(fluxtimer)
      fluxtimer = nil 
   end
   OppLostAff("timeflux")
end
