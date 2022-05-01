if ak.ai() then return end
if IsTargetted(matches[2]) then
   OppGainedAff("hierophant")
   if ak.timers.Hiero then killTimer(ak.timers.Hiero) end
   ak.timers.Hiero = tempTimer(60,[[
      if affstrack.score.hierophant > 0 then 
         OppLostAff("hierophant")
      end
      killTimer(ak.timers.Hiero)
   ]])
end
