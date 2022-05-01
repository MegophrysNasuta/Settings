function wsys.aeonedGained(event, affliction, class)
  if event == "got aff" then
    if affliction == "aeon" and not wsys.retard then
      send("curing batch off", false)
      send("curing siphealth " .. wsys.settings.aeonsiphealth, false)
      send("curing sipmana " .. wsys.settings.aeonsipmana, false)
      send("curing mosshealth 0", false)
      send("curing mossmana 0", false)
      wsys.switchPrios( "asthma", 3 )
      wsys.switchPrios( "weariness", 4 )
      wsys.switchPrios( "anorexia", 5 )
      wsys.switchPrios( "impatience", 7 )
      wsys.switchPrios( "paralysis", 8 )
      wsys.waittime = 1 + wsys.myPing()*3
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.aeonedGained")

function wsys.aeonedLost(event, affliction)
  if event == "lost aff" then
    if affliction == "aeon" then
      send("curing batch on", false)
      send("curing siphealth " .. wsys.settings.siphealth, false)
      send("curing sipmana " .. wsys.settings.sipmana, false)
      if wsys.settings.usemoss then send("curing mosshealth " .. wsys.settings.mosshealth - 10, false) end
      if wsys.settings.usemoss then send("curing mossmana " .. wsys.settings.mossmana - 10, false) end
      wsys.affPrioRestore( "asthma" )
      wsys.affPrioRestore( "weariness" )
      wsys.affPrioRestore( "anorexia" )
      wsys.affPrioRestore( "impatience" )
      wsys.affPrioRestore( "paralysis" )
      if wsys.retard then wsys.retardationOff() end
      wsys.waittime = wsys.myPing()*2
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.aeonedLost")

function wsys.unaeonDiagnose()
  wsys.promptTrigger("something", function()
    if not wsys.aff.aeon and wsys.waittime > 1 then
      send("curing batch on", false)
      send("curing siphealth " .. wsys.settings.siphealth, false)
      send("curing sipmana " .. wsys.settings.sipmana, false)
      if wsys.settings.usemoss then send("curing mosshealth " .. wsys.settings.mosshealth - 10, false) end
      if wsys.settings.usemoss then send("curing mossmana " .. wsys.settings.mossmana - 10, false) end
      wsys.waittime = wsys.myPing()*2
      if wsys.retard then wsys.retardationOff() end
    end
  end)
end

registerAnonymousEventHandler("reset aff prios", "wsys.unaeonDiagnose")
