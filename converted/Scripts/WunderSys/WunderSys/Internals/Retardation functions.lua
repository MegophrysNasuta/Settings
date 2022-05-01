function wsys.retardationOn()
 if not wsys.retard then
  wsys.retard = true
  wsys.waittime = 1 + wsys.myPing()*3
  wsys.slowedsipping()
  wsys.report("<red>RETARDATION curing enabled")
  wsys.retardationDownCheck()
 end
end

function wsys.retardationOff()
 wsys.aff.aeon = nil
 wsys.retard = false
 wsys.normalsipping()
 send("curing batch on", false)
 wsys.waittime = wsys.myPing()*2
 vibeSpinner = nil
 wsys.report("<red>RETARDATION curing disabled")
end

function wsys.slowedsipping()
  send("curing siphealth " .. wsys.settings.aeonsiphealth, false)
  send("curing sipmana " .. wsys.settings.aeonsipmana, false)
  send("curing mosshealth 0", false)
  send("curing mossmana 0", false)
end

function wsys.normalsipping()
  send("curing siphealth " .. wsys.settings.siphealth, false)
  send("curing sipmana " .. wsys.settings.sipmana, false)
  if wsys.settings.usemoss then wsys.mossThreshholdDown() end
end

function wsys.retardationDownCheck()
  if wsys.timer.retardDropDetectionTimer then killTimer(wsys.timer.retardDropDetectionTimer) end
  wsys.timer.retardDropDetectionTimer = tempTimer(5, [[wsys.timer.retardDropDetectionTimer = nil;if wsys.retard then wsys.retardationOff() end]])
end

function wsys.serversideRetardationDetection(cure)
  if not wsys.aff.aeon and not wsys.aff.blackout then
    wsys.retardationOn()
  end
end
