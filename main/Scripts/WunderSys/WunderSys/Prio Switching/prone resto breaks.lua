function wsys.proneGained(event, affliction, class)
  if event == "got aff" then
    if (wsys.aff.damagedleftleg or wsys.aff.mangledleftleg or wsys.aff.damagedrightleg or wsys.aff.mangledrightleg or wsys.aff.bleg) and wsys.aff.prone and not wsys.vmode and not wsys.heartseedmode and not wsys.dwbmode and not wsys.bardmode then
      wsys.switchPrios( "damagedleftleg", 6 )
      wsys.switchPrios( "damagedrightleg", 6 )
      wsys.switchPrios( "mangledleftleg", 6 )
      wsys.switchPrios( "mangledrightleg", 6 )
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.proneGained")
registerAnonymousEventHandler("reset aff prios", "wsys.proneGained")


function wsys.proneLost(event, affliction)
  if event == "lost aff" then
    if affliction == "prone" and not wsys.vmode and not wsys.heartseedmode and not wsys.dwbmode and not wsys.bardmode then
      wsys.affPrioRestore( "damagedleftleg" )
      wsys.affPrioRestore( "damagedrightleg" )
      wsys.affPrioRestore( "mangledleftleg" )
      wsys.affPrioRestore( "mangledrightleg" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.proneLost")
