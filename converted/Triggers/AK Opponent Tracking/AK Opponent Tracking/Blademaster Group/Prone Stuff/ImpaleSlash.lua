if IsTargetted(matches[3]) then
	OppGainedAff("impaleslash")
   if impaleslashtimer then killTimer(impaleslashtimer);impaleslashtimer = nil end
   impaleslashtimer = tempTimer(30, [[OppLostAff("impaleslash")]])
end
