function wsys.asthmaWearinessSlicknessGained(event, affliction, class)
  --[[if event == "got aff" then
      if wsys.aff.slickness and (wsys.aff.asthma and wsys.aff.weariness) then --1 scenario
        wsys.switchPrios( "asthma", 2 )
      end
  end]]
end --func

--registerAnonymousEventHandler("got aff", "wsys.asthmaWearinessSlicknessGained")
--registerAnonymousEventHandler("reset aff prios", "wsys.asthmaWearinessSlicknessGained")

function wsys.asthmaLost(event, affliction)
  --[[if event == "lost aff" then
    if affliction == "asthma" and (wsys.affPosition("asthma") ~= wsys.defaultAffPosition("asthma")) then
      wsys.affPrioRestore( "asthma" )
    end
  end]]
end --func

--registerAnonymousEventHandler("lost aff", "wsys.asthmaLost")
