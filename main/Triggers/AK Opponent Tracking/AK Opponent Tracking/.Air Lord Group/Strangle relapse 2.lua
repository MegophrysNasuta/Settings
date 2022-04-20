aff = "disrupted"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	 ak.duress.stranglerelapse = true
	 killTimer(tostring(ak.duress.stranglerelapsetimer))
   ak.duress.stranglerelapsetimer = tempTimer(7,[[
   	 ak.duress.stranglerelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
	 OppGainedAff("deadening")
end
