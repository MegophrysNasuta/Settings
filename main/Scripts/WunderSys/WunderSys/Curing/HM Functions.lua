wsys.hmprio = "h"

function wsys.hmbal()
  wsys.hmbalsub()
  wsys.gotBal("hm")
end -- if

function wsys.sipped(elix)
  if wsys.sipping == "health" or wsys.sipping == "mana" then
    wsys.lostBal("hm", 6)
    if wsys.cancure() and wsys.settings.usemoss then wsys.mossThreshholdUp() end
  elseif wsys.sipping == "immunity" then
    wsys.cure = wsys.sipping
  end
end

function wsys.mossed()
  wsys.lostBal("moss", 6.5)
end

function wsys.mossbal()
  wsys.gotBal("moss")
end

function wsys.mossThreshholdDown()
  local mh = wsys.settings.mosshealth - 10
  local mm = wsys.settings.mossmana - 10
  if mh < 0 then mh = 0 end
  if mm < 0 then mm = 0 end
  send("curing mosshealth " .. mh, false)
  send("curing mossmana " .. mm,false)
end

function wsys.mossThreshholdUp()
  send("curing mosshealth "..wsys.settings.mosshealth, false)
  send("curing mossmana "..wsys.settings.mossmana, false)
end

function wsys.mossThreshholdDownFailsafe(event, bal)
  if event == "got bal" and bal == "hm"  then
    if wsys.cancure() and wsys.settings.usemoss then wsys.mossThreshholdDown() end
  end
end

registerAnonymousEventHandler("got bal", "wsys.mossThreshholdDownFailsafe")

function wsys.manaprio()
 wsys.hmprio = "m"
 send("curing priority mana")
 wsys.report("Switched to <deep_sky_blue>MANA <red>priority")
end

function wsys.healthprio()
 wsys.hmprio = "h"
 send("curing priority health")
 wsys.report("Switched to <green>HEALTH <red>priority")
end

function onSap()
  if wsys.hmprio == "h" then
    wsys.manaprio()
    if sapManaSipTimer then killTimer(tostring(sapManaSipTimer)) end
    sapManaSipTimer = tempTimer(5, [[sapManaSipTimer = nil;wsys.healthprio()]]) 
  end
end

function hmtoggle()
  if wsys.hmprio == "h" then
    wsys.manaprio()
  else
    wsys.healthprio()
  end -- if
end

function wsys.moss()
  if wsys.settings.usetransmutation then
    wsys.osend("outr potash")
    wsys.osend("eat potash")
  else
    wsys.osend("outr irid")
    wsys.osend("eat irid")
  end
end

function wsys.hmsip(hm)
  if hm == "health" then
    wsys.osend("sip health")
  elseif hm == "mana" then
    wsys.osend("sip mana")
  else
   wsys.report("Not a valid thing to sip, check your wsys.hmsip() implementation")
  end
end




