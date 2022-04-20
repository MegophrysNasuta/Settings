wsys.aeoncolour()
if wsys.aff.blackout and not wsys.aff.aeon and ((wsys.classTimerExists("jester") or wsys.classTimerExists("shaman") or wsys.classTimerExists("occultist") or wsys.classTimerExists("tarot")) and not wsys.classTimerExists("magi")) then
  wsys.affadd("aeon")
  send("curing unpredict aeon", false)
  send("curing predict aeon", false)
end
