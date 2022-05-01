if wsys.timer.snap then
  killTimer(tostring(wsys.timer.snap))
end
wsys.timer.snap = tempTimer(8, [[wsys.timer.snap = nil]])
