function wsys.haemoBleedGain(event, affliction, class)
  if event == "got aff" then
    if affliction == "bleeding" and wsys.classTimerExists("shaman") then
      local bleedthreshold = (wsys.stats.h - 1500) / 6 * 0.66
      if wsys.bleedtype == "health" and wsys.bleeding > bleedthreshold then
        wsys.switchPrios( "haemophilia", 1 )
      end
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.haemoBleedGain")
registerAnonymousEventHandler("reset aff prios", "wsys.haemoBleedGain")


function wsys.haemoLost(event, affliction)
  if event == "lost aff" then
    if affliction == "haemophilia" and (wsys.affPosition("haemophilia") ~= wsys.defaultAffPosition("haemophilia")) then
      wsys.affPrioRestore( "haemophilia" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.haemoLost")

