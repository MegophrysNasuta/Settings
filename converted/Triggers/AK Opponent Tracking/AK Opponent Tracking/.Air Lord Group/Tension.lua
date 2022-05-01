local aff = "tension"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
	 if ak.duress.pressure and ak.duress.pressure > 0 then
      ak.duress.pressure = ak.duress.pressure + 1
   else
      ak.duress.pressure = 1
   end
   killTimer(tostring(ak.duress.asphyxiatetimer))
   ak.duress.asphyxiatetimer = tempTimer(10, [[ak.duress.asphyxiate = false]])
end

