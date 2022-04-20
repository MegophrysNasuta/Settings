if wsys.bals.b and wsys.bals.e then
  enableTrigger("Diagnose")
wsys.salviaSend("diagnose")
if wsys.timer.diagwait then
  killTimer(tostring(wsys.timer.diagwait))
  end
wsys.timer.diagwait = tempTimer(wsys.myPing() * 3, [[wsys.timer.diagwait = nil;disableTrigger("Diagnose")]])
elseif not wsys.doqueue_pending or wsys.doqueue_pending.element.ac ~= "diagnose" then
  enableTrigger("Diagnose")
  wsys.dofirst( "diagnose", 5, true )
  if wsys.timer.diagwait then
    killTimer(tostring(wsys.timer.diagwait))
  end
  wsys.timer.diagwait = tempTimer( 8, [[wsys.timer.diagwait = nil;disableTrigger("Diagnose")]])
elseif wsys.doqueue_pending and wsys.doqueue_pending.element.ac == "diagnose" then
  if wsys.timer.diagwait then
    killTimer(tostring(wsys.timer.diagwait))
  end
  wsys.timer.diagwait = tempTimer( 8, [[wsys.timer.diagwait = nil;disableTrigger("Diagnose")]])
end
