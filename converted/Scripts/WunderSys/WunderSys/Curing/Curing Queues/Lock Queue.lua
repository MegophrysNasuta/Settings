function wsys.lockqueue()
  if wsys.cancure() then
  --asthma anorexia slickness impatience/off focus bal
    if wsys.aff.asthma and wsys.aff.anorexia and wsys.aff.slickness and (wsys.aff.impatience or not wsys.bals.focus) then
      if (not wsys.aff.paralysis and wsys.bals.tree) and not wsys.damagedarms() then
       	wsys.tree()
      elseif (wsys.isClass("magi") or wsys.isClass("sylvan")) and not wsys.isHindered() and wsys.bals.b and wsys.bals.e then
        send("cast bloodboil")
      elseif wsys.isClass("alchemist") and not wsys.isHindered() and wsys.bals.b and wsys.bals.e then
        send("educe salt")
      elseif (wsys.isClass("sentinel") or wsys.isClass("druid")) and not wsys.aff.weariness and wsys.bals.b and wsys.bals.e then
        sendAll("morph jaguar", "fitness")
      elseif (wsys.isClass("sentinel") or wsys.isClass("druid")) and wsys.bals.b and wsys.bals.e then
        sendAll("morph jaguar", "might")
      elseif wsys.isClass("serpent") and not wsys.aff.weariness and wsys.bals.b and wsys.bals.e then
        wsys.shrug()
      elseif (wsys.isClass("occultist") or wsys.isClass("jester")) and wsys.bals.b and wsys.bals.e and not wsys.isHindered() and not wsys.timer.foolwait and wsys.bals.fool then
        wsys.fool()
      elseif wsys.isFitnessClass() and wsys.bals.fitness and not wsys.aff.weariness then --and wsys.bals.b and wsys.bals.e
        wsys.fitness()
      elseif wsys.isDragon() and wsys.bals.dragonheal and wsys.bals.b and wsys.bals.e and wsys.stats.m >= 1500 and not (wsys.aff.weariness and wsys.aff.recklessness) then
        wsys.dheal()
      else
        cecho("\n<pale_violet_red>TRUELOCK SUSPECTED, DIAGNOSE OR GO MANUAL\n")
      end --curable lock bit end
      --vivi mode curing
    elseif wsys.vmode and not wsys.bals.salve and (wsys.stats.m >= 100) and wsys.damagedarms() and wsys.bothdamagedlegs() and (wsys.aff.brokenleftarm or wsys.aff.brokenrightarm or wsys.aff.brokenleftleg or wsys.aff.brokenrightleg) then
        cecho("<orange>should be restoring")
        wsys.restore()
    -- empty valerian pipe
    elseif wsys.aff.impatience and wsys.aff.anorexia and wsys.aff.slickness and (wsys.aff.asthma or wsys.emptyValerianPipes()) then
      if ((not wsys.aff.paralysis and wsys.bals.tree) and not wsys.timer.treewait) and not wsys.damagedarms() then
          wsys.tree()
      end
    -- Riftlock
    elseif wsys.aff.asthma and wsys.aff.slickness and wsys.damagedarms() and wsys.herbsout.kelp < 1 and wsys.herbsout.aurum < 1 and wsys.herbsout.bloodroot < 1 and wsys.herbsout.magnesium < 1 then
     if wsys.isFitnessClass() and wsys.bals.b and wsys.bals.e and wsys.bals.fitness and not wsys.aff.weariness then
      wsys.fitness()
     elseif wsys.settings.dform and wsys.bals.dragonheal and wsys.bals.b and wsys.bals.e and wsys.stats.m >= 1500 then -- elseif
      wsys.dheal()
     elseif (wsys.aff.brokenleftarm or wsys.aff.brokenrightarm) and wsys.bals.b and wsys.bals.e then
      wsys.restore()
     else
      cecho("\n<pale_violet_red>RIFTLOCK SUSPECTED, DIAGNOSE OR GO MANUAL\n")
     end
    -- Special tree cases 
    elseif (not wsys.aff.paralysis and wsys.bals.tree) and not wsys.damagedarms() then
			local kelp = wsys.affamount("kelp")
			local ginseng = wsys.affamount("kelp")
			if wsys.aff.slickness and wsys.aff.asthma and kelp >= 3 and (kelp + ginseng >= 4) then
				-- Not a lock, but we're far behind and asthma is buried
				wsys.tree()
			end
   	end
  end -- if
end -- func
