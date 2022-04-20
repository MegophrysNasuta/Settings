if IsTargetted(matches[2]) then
	OppGainedAff("voidfist")
   if voidtimer then killTimer(voidtimer) end
	 if ak.limbs.blademaster.stance["Me"] == "Sanya" then
      voidtimer = tempTimer(20, [[OppLostAff("voidfist")]])	 
	 else
      voidtimer = tempTimer(15, [[OppLostAff("voidfist")]])
   end
end

