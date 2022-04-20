aff = "deadening"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	 ak.duress.stranglerelapse = true
   ak.duress.stranglerelapsetimer = tempTimer(7,[[
   	 ak.duress.stranglerelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
	 killTimer(tostring(ak.duress.asphyxiatetimer))
   ak.duress.asphyxiatetimer = tempTimer(10, [[ak.duress.asphyxiate = false]])
end
