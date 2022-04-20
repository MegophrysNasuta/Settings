function wsys.scytherusAndParalysisGained(event, affliction, class)
  if event == "got aff" then
    if wsys.aff.scytherus and wsys.aff.paralysis then
      wsys.switchPrios( "scytherus", 2 )
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.scytherusAndParalysisGained")
registerAnonymousEventHandler("reset aff prios", "wsys.scytherusAndParalysisGained")

function wsys.scytherusAndParalysisLost(event, affliction)
  if event == "lost aff" then
    if affliction == "scytherus" and (wsys.affPosition("scytherus") ~= wsys.defaultAffPosition("scytherus")) then
      wsys.affPrioRestore( "scytherus" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.scytherusAndParalysisLost")
