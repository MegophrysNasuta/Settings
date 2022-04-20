if IsTargetted(matches[2]) then
   ak.duress.zephyrrelapse = true
   killTimer(tostring(ak.duress.zephyrrelapsetimer))
   ak.duress.zephyrrelapsetimer = tempTimer(7,[[
   	 ak.duress.zephyrrelapse = false
     ak.scoreup(]]..matches[2]..[[)
   ]])
	 OppGainedAff("manaleech")
	 OppGainedAff("deadening")
end
