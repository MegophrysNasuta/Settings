aff = "manaleech"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	 ak.duress.zephyrrelapse = true
 	 killTimer(tostring(ak.duress.zephyrrelapsetimer))
   ak.duress.zephyrrelapsetimer = tempTimer(7,[[
   	 ak.duress.zephyrrelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
	 
	 killTimer(tostring(ak.duress.asphyxiatetimer))
   ak.duress.asphyxiatetimer = tempTimer(10, [[ak.duress.asphyxiate = false]])
end
