function wsys.darkshadeGained(event, affliction, class)
  if event == "got aff" then
    if affliction == "darkshade" then
      if wsys.lightwall then
        --wsys.switchPrios( "darkshade", 5, true )
        wsys.darkshadeTimer(true)
      else
        wsys.darkshadeTimer(false)
      end
    end
  end
end --func

if wsys.events.got_darskade then killAnonymousEventHandler( wsys.events.got_darskade ) end

wsys.events.got_darskade = registerAnonymousEventHandler("got aff", "wsys.darkshadeGained")

function wsys.darkshadeLost(event, affliction)
  if event == "lost aff" then
    if affliction == "darkshade" then
      wsys.affPrioRestore( "darkshade" )
      if wsys.timer.darkshade then killTimer(tostring(wsys.timer.darkshade)) end
      wsys.timer.darkshade = nil
    end
  end
end --func

if wsys.events.lost_darskade then killAnonymousEventHandler( wsys.events.lost_darskade ) end
wsys.events.lost_darskade = registerAnonymousEventHandler("lost aff", "wsys.darkshadeLost")


function wsys.darkshadeTimer(lightwall)
  if wsys.lightwall then
    if not wsys.timer.darkshade then
      wsys.timer.darkshade = tempTimer(8, [[wsys.timer.darkshade = nil;wsys.switchPrios( "darkshade", 2 )]])
    end
  else
    if not wsys.timer.darkshade then
      wsys.timer.darkshade = tempTimer(15, [[wsys.timer.darkshade = nil;wsys.switchPrios( "darkshade", 2 )]])
    end
  end
end



