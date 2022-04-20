wsys.meditating = false

function wsys.toggleMeditate()
  if wsys.meditating then
    wsys.meditating = false
    wsys.report("<red>Stopped <white>Meditating")
  else
    wsys.meditating = true
    wsys.meditate()
    wsys.report("<green>Started <white>Meditating")
  end
end

function wsys.meditate()
  if wsys.cancure() and not wsys.timer.medwait then
    wsys.dofreeadd("meditate")
    if wsys.timer.medwait then killTimer(wsys.timer.medwait) end
    wsys.timer.medwait = tempTimer(wsys.myPing()*2, [[wsys.timer.medwait = nil]])
  end --if
end --func

function wsys.stopmeditating()
  wsys.meditating = false
  wsys.report("Done meditating")
end
