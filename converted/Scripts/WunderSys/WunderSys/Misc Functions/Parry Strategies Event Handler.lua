function wsys.parryStrat(event, limb)
   if wsys.settings.parrystrategy == "lasthit" then
    wsys.parryf(limb)
   end
end

registerAnonymousEventHandler("myLimbHit", "wsys.parryStrat")
