function wsys.asthmaHandling(event, affliction, class)
  if event == "got aff" then
    if wsys.aff.asthma and wsys.aff.slickness --[[ and not wsys.aff.impatience ]] and ( wsys.aff.weariness or wsys.aff.paralysis ) then
      wsys.switchPrios("asthma", 2 )
    elseif wsys.aff.impatience and wsys.aff.asthma and wsys.classTimerExists("alchemist") then
      wsys.switchPrios("asthma", 1 )
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.asthmaHandling")
registerAnonymousEventHandler("reset aff prios", "wsys.asthmaHandling")


function wsys.asthmaHandlingLost(event, affliction)
  if event == "lost aff" then
    if not (wsys.aff.asthma and wsys.aff.slickness and not wsys.aff.impatience and ( wsys.aff.weariness or wsys.aff.paralysis )) and not wsys.classTimerExists("alchemist") then
      wsys.affPrioRestore( "asthma" )
    elseif not (wsys.aff.impatience and wsys.aff.asthma) and wsys.classTimerExists("alchemist") and (wsys.affPosition("temperedcholeric") ~= 2) then
      wsys.affPrioRestore( "asthma" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.asthmaHandlingLost")
