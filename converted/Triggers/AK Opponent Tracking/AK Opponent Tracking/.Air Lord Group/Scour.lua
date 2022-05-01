aff = "disloyalty"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	 ak.duress.scourrelapse = true
	 killTimer(tostring(ak.duress.scourrelapsetimer))
   ak.duress.scourrelapsetimer = tempTimer(7,[[
   	 ak.duress.scourrelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
	 
	 killTimer(tostring(ak.duress.asphyxiatetimer))
   ak.duress.asphyxiatetimer = tempTimer(10, [[ak.duress.asphyxiate = false]])
end
