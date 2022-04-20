function wsys.confusionAndDisruptGained(event, affliction, class)
  if event == "got aff" then
    if wsys.aff.confusion and wsys.aff.disrupted and (not wsys.bals.focus or wsys.aff.impatience) and not wsys.aff.whisperingmadness then --2 scenario
      wsys.switchPrios( "confusion", 2 )
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.scytherusAndParalysisLost")
registerAnonymousEventHandler("reset aff prios", "wsys.scytherusAndParalysisLost")

function wsys.confusionAndDisruptLost(event, affliction)
  if event == "lost aff" then
    if affliction == "confusion" and (wsys.affPosition("confusion") ~= wsys.defaultAffPosition("confusion"))  then
      wsys.affPrioRestore( "confusion" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.confusionAndDisruptLost")
