wsys.pipes.unlitpipes = true
if not wsys.paused and not wsys.softpaused and not wsys.timer.lightpipewait then
  wsys.timer.lightpipewait = tempTimer(0.5, [[wsys.timer.lightpipewait = nil]])
  wsys.dofreefirst("light pipes")
end
