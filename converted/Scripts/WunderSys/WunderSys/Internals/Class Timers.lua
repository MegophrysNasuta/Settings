-- classtimers table
wsys.classtimers = wsys.classtimers or {}

--event handling thingy
function wsys.classTimers(event, affliction, class)
  if event == "got aff" then
    if class ~= nil then
      wsys.newClassTimer(class)
    end
  end
end --func

--start a class timer
function wsys.newClassTimer( class )
  if table.contains(wsys.classtimers, class) then
    wsys.killClassTimer(class, true)
  else
    raiseEvent("class timer started", class)
  end
  wsys.classtimers[class] = tempTimer(45, function() wsys.killClassTimer(class) end)
end

--kill a class timer
function wsys.killClassTimer( class, no_event )
  if wsys.classtimers[class] then killTimer(wsys.classtimers[class]) end
  if table.contains(wsys.classtimers, wsys.classtimers[class]) then
    wsys.classtimers[class] = nil
    if not no_event then raiseEvent("class timer ended", class) end
  end
end

function wsys.classTimerExists(class)
  if table.contains(wsys.classtimers, wsys.classtimers[class]) then return true else return false end
end

--registerAnonymousEventHandler("got aff", "wsys.classTimers")

