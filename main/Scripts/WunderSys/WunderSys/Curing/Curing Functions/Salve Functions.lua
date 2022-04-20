function wsys.affcuredsalve(affliction)
 wsys.applying = nil
end -- func


function wsys.emptysalve()
 for k,v in pairs(wsys.tb.cures[wsys.applying]) do
   wsys.predicted[v] = nil
	
   if wsysf.affs[v] then
     wsysf.core.debug.print(2, "Empty salve should clear ".. v.."?")
   end
   disableTrigger(string.title(v) .. " -")
 end -- for
 wsys.pairscheck(wsys.cure)
 wsys.applying = nil
 wsys.cure = nil
 disableTrigger("Empty Salves")
end -- func


function wsys.mendingreset()
 if wsys.applying == "mendinglegs" then
  if wsys.aff.brokenrightleg then
   wsys.aff.damagedrightleg = true
   enableTrigger("Damagedrightleg -")
   wsys.aff.brokenrightleg = nil
   disableTrigger("Brokenrightleg -")
  end -- if
  if wsys.aff.brokenleftleg then
   wsys.aff.damagedleftleg = true
   enableTrigger("Damagedleftleg -")
   wsys.aff.brokenleftleg = nil
   disableTrigger("Brokenleftleg -")
  end -- if
  if wsys.aff.cleg then
   wsys.aff.cleg = nil
   disableTrigger("Cleg -")
   wsys.aff.bleg = true
   enableTrigger("Bleg -")
  end -- if
 elseif wsys.applying == "mendingarms" then
  if wsys.aff.brokenrightarm then
   wsys.aff.brokenrightarm = nil
   disableTrigger("Brokenrightarm -")
   wsys.aff.damagedrightarm = true
   enableTrigger("Damagedrightarm -")
  end -- if
  if wsys.aff.brokenleftarm then
   wsys.aff.brokenleftarm = nil
   disableTrigger("Brokenleftarm -")
   wsys.aff.damagedleftarm = true
   enableTrigger("Damagedleftarm -")
  end -- if
  if wsys.aff.carm then
   wsys.aff.carm = nil
   disableTrigger("Carm -")
   wsys.aff.barm = true
   enableTrigger("Barm -")
  end -- if
 end -- if
 wsys.applying = false
 wsys.cure = nil
 disableTrigger("Empty Salves")
end -- func


function wsys.restoreset()
 if not wsys.lifevision then
  if wsys.applying == "restorationlegs" then
   wsys.aff.damagedleftleg = nil
   wsys.aff.damagedrightleg = nil
   wsys.aff.mangledleftleg = nil
   wsys.aff.mangledrightleg = nil
   wsys.aff.bleg = nil
  elseif wsys.applying == "restorationarms" then
   wsys.aff.damagedleftarm = nil
   wsys.aff.damagedrightarm = nil
   wsys.aff.mangledleftarm = nil
   wsys.aff.mangledrightarm = nil
   wsys.aff.barm = nil
  elseif wsys.applying == "restorationhead" then
   wsys.aff.damagedhead = nil
   wsys.aff.mangledhead = nil
  elseif wsys.applying == "restorationtorso" then
   wsys.aff.mildtrauma = nil
   wsys.aff.serioustrauma = nil
   wsys.aff.heartseed = nil
  end -- if
 end -- if
 wsys.applying = false
 wsys.cure = nil
 disableTrigger("Empty Salves")
end -- func


function wsys.salvebal()
 if wsys.applying then
   wsys.gotBal("salve")
   wsys.applying = false
 end
end -- func

function wsys.applied()
 if wsys.applying then
  if string.starts(wsys.applying, "restoration") then
    if wsys.aff.timeflux then
      wsys.lostBal("salve", 6.3)
    else
      wsys.lostBal("salve", 4.3)
    end
  else
    if wsys.aff.timeflux then
      wsys.lostBal("salve", 1.4)
    else
      wsys.lostBal("salve", 1.9)
    end
  end
 end
end
