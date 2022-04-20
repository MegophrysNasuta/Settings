wsys.paused = false
wsys.softpaused = false

function wsys.pause()
  if not wsys.paused then
    wsys.report("Paused")
    wsys.paused = true
    send("curing off")
  end
end

function wsys.unpause()
  if wsys.paused then
    wsys.report("UNpaused")
    wsys.paused = false
    send("curing on")
    --wsys.lyrequeue()

    wsys.canaction()
  end
end

function wsys.togglePause()
  if wsys.paused then
    wsys.unpause()
  elseif not wsys.paused then
    wsys.pause()
  end
end

function wsys.softpause()
  if not wsys.softpaused then
    wsys.report("SoftPaused")
    wsys.softpaused = true
    send("curing off")
  end
end

function wsys.unsoftpause()
  if wsys.softpaused then
    wsys.report("UNSoftPaused")
    wsys.softpaused = false
    send("curing on")
    --wsys.lyrequeue()

    wsys.canaction()
  end
end

function wsys.toggleSoftPause()
  if wsys.softpaused then
    wsys.unsoftpause()
  elseif not wsys.softpaused then
    wsys.softpause()
  end
end
