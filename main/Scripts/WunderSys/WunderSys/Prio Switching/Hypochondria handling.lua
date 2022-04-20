function wsys.hypochondriaFull(event, affliction, class)
  if event == "got aff" then
    if (wsys.aff.lethargy or wsys.aff.nausea or wsys.aff.addiction or wsys.aff.darkshade) and wsys.aff.hypochondria then
      wsys.switchPrios( "hypochondria", 1 )
      wsys.switchPrios( "impatience", 4)
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.hypochondriaFull")
registerAnonymousEventHandler("reset aff prios", "wsys.hypochondriaFull")

function wsys.hypochondriaLost(event, affliction)
  if event == "lost aff" then
    if affliction == "hypochondria" then
      wsys.affPrioRestore( "hypochondria" )
      wsys.affPrioRestore( "impatience" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.hypochondriaLost")
