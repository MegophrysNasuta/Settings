function wsys.slicknessKelpStackedGained(event, affliction, class)
  if event == "got aff" then
      if (wsys.aff.sensitivity or wsys.aff.clumsiness or wsys.aff.weariness or wsys.aff.hypochondria) and wsys.aff.asthma and (wsys.aff.slickness and not wsys.aff.demonstain) and not wsys.aff.anorexia then 
		 --1 scenario
        --wsys.switchPrios( "slickness", 1 )
      end
    end
end --func

registerAnonymousEventHandler("got aff", "wsys.slicknessKelpStackedGained")
registerAnonymousEventHandler("reset aff prios", "wsys.slicknessKelpStackedGained")

function wsys.slicknessLost(event, affliction)
  if event == "lost aff" then
    if (wsys.affPosition("slickness") ~= wsys.defaultAffPosition("slickness")) and not wsys.aff.asthma and not (wsys.aff.sensitivity or wsys.aff.clumsiness or wsys.aff.weariness or wsys.aff.hypochondria) then
      wsys.affPrioRestore( "slickness" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.slicknessLost")
