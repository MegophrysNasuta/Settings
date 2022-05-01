function wsys.magisalvehandling(event, affliction)
  if event == "got aff" and wsys.classTimerExists("magi") and not wsys.raid then
    if affliction == "dehydrated" or (affliction == "burning" and wsys.aff.dehydrated) then
      --move up burning real high #1 or so
      wsys.switchPrios( "burning", 1 )
    elseif affliction == "hypothermia" then
      --hypothermia, cant cure freeze stuff.
      wsys.switchPrios( "shivering", 20 )
      wsys.switchPrios( "frozen", 20 )
    end
    if wsys.aff.frozen or wsys.aff.shivering and not wsys.aff.dehydrated and (wsys.affPosition("frozen") ~= 2) then
      --move up frozen and shivering and caloric def
      wsys.switchPrios( "shivering", 2 )
      wsys.switchPrios( "frozen", 2 )
      wsys.osend("curing priority defence insulation 2")
    end
  elseif event == "lost aff" and wsys.classTimerExists("magi") and not wsys.raid then
    if affliction == "hypothermia" then
      if wsys.aff.frozen or wsys.aff.shivering and (wsys.affPosition("frozen") ~= 2) then
        wsys.switchPrios( "shivering", 2 )
        wsys.switchPrios( "frozen", 2 )
        wsys.osend("curing priority defence insulation 2")
      else
        if wsys.affPosition("frozen") ~= wsys.defaultAffPosition("frozen") then
          wsys.affPrioRestore( "frozen" )
        end
        if wsys.affPosition("shivering") ~= wsys.defaultAffPosition("shivering") then
          wsys.affPrioRestore( "shivering" )
          send("curing priority defence insulation " .. wsys.settings["defprio"][wsys.profile][wsys.myClass()]["caloric"])
        end
      end
    elseif affliction == "dehydrated" then
      if wsys.affPosition("burning") ~= wsys.defaultAffPosition("burning") then
        cecho("\n<yellow>Resetting burning from dehydrate loss\n") 
        wsys.affPrioRestore( "burning" )
      end
    end
  end
  --timeflux strats, think on this for later.
end

registerAnonymousEventHandler("got aff", "wsys.magisalvehandling")
registerAnonymousEventHandler("lost aff", "wsys.magisalvehandling")



function wsys.stoppedfightingmagi(event, class)
  if event == "class timer ended" and class == "magi" then
    if wsys.affPosition("frozen") ~= wsys.defaultAffPosition("frozen") then
      wsys.affPrioRestore( "frozen" )
    end
    if wsys.affPosition("shivering") ~= wsys.defaultAffPosition("shivering") then
      wsys.affPrioRestore( "shivering" )
      wsys.enableSSDef( "insulation", wsys.settings.defprio[wsys.profile][wsys.myClass()].insulation or 25 ) --Medi
    end
    if wsys.affPosition("burning") ~= wsys.defaultAffPosition("burning") then
      cecho("\n<yellow>Resetting burning from class timer\n") 
      wsys.affPrioRestore( "burning" )
    end
  end
end
registerAnonymousEventHandler("class timer ended", "wsys.stoppedfightingmagi")


