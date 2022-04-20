cecho("\n<red>BLADETWIST!! BLADETWIST!! BLADETWIST!!\n<red>BLADETWIST!! BLADETWIST!! BLADETWIST!!")
if not wsys.raid then
  wsys.manaprio()
  if wsys.timer.bladetwisttimer then killTimer(tostring(wsys.timer.bladetwisttimer)) end
  wsys.timer.bladetwisttimer = tempTimer(7, [[wsys.timer.bladetwisttimer = nil;wsys.healthprio()]])
end
wsys.bleedingfor(wsys.bleeding + 200, "health")


