function wsys.canaction()
 if wsys.timer.balwait then
  killTimer(tostring(wsys.timer.balwait))
  wsys.timer.balwait = nil
 end
 wsys.balqueue()
end -- func
