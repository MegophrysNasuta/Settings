if IsTargetted(matches[2]) then
	OppGainedAff("airfist")
   if airfisttimer then killTimer(airfisttimer) end
	 if ak.limbs.blademaster.stance["Me"] == "Thyr" then
      airfisttimer = tempTimer(19.5, [[OppLostAff("airfist")]])	 
	 else
      airfisttimer = tempTimer(14.5, [[OppLostAff("airfist")]])
   end
end



