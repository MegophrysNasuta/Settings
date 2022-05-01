function wsys.qq()
  if wsys.innewsroom then
    send("quit")
  else
    wsys.qqing = true
    send("qq")
  end
end

function wsys.startedqq()
  if not wsys.innewsroom then
    wsys.saveSettings(true)
    send("inrift all")
    wsys.keepout = {}
    --start a 30s failsafe to keep herbs out
    if wsys.timer.qqfailsafe then killTimer(wsys.timer.qqfailsafe) end
    wsys.timer.qqfailsafe = tempTimer(30, [[wsys.timer.qqfailsafe = nil;wsys.setkeepouttable();wsys.outrqueue()]])
  else
    wsys.report("In a news room location, please go somewhere else if you wish to QQ/QUIT.")
  end
end

function wsys.stoppedqq()
   wsys.qqing = false
   wsys.setkeepouttable()
   wsys.outrqueue()
end
