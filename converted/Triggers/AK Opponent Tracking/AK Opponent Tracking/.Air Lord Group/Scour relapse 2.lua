if IsTargetted(matches[2]) then
   local aff = "disloyalty"
   OppGainedAff(aff)
   ak.duress.scourrelapse = true
	 killTimer(tostring(ak.duress.scourrelapsetimer))
   ak.duress.scourrelapsetimer = tempTimer(7,[[
   	 ak.duress.scourrelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
end
