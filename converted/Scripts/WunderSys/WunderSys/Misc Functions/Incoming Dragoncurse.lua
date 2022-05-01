function wsys.incomingDragoncurse()
  if wsys.timer.incomingdcurse then killTimer(wsys.timer.incomingdcurse) end
  wsys.timer.incomingdcurse = tempTimer(1-wsys.myPing()*2, [[wsys.timer.incomingdcurse = nil]])
end
