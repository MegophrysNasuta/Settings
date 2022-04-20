function wsys.stand()
 if wsys.timer.standwait then
  killTimer(tostring(wsys.timer.standwait))
 end
 wsys.timer.standwait = tempTimer(wsys.waittime, [[wsys.timer.standwait = nil]])
 send("curing queue remove stand")
 send("curing queue add stand")
end -- func


function wsys.stood()
 if wsys.cure == "stand" then
  wsys.affcured("prone")
  wsys.cure = nil
 end
end -- func

function wsys.mountCommand()
  return wsys.settings.havevault and "vault" or "mount"
end

function wsys.mount()
 enableTrigger("Mount")
 if wsys.timer.standwait then
  killTimer(tostring(wsys.timer.standwait))
 end
 wsys.timer.standwait = tempTimer(wsys.waittime, [[wsys.timer.standwait = nil]])
 wsys.osend("drop " .. wsys.settings.mount)
 wsys.osend(wsys.mountCommand().." " .. wsys.settings.mount)
end -- func


function wsys.mountd()
 disableTrigger("Mount")
 if wsys.timer.standwait then
  killTimer(tostring(wsys.timer.standwait))
  wsys.timer.standwait = nil
  wsys.def.mounted = true
 end -- if
end -- func


function wsys.dismount()
 if wsys.timer.standwait then
  killTimer(tostring(wsys.timer.standwait))
 end
 wsys.timer.standwait = tempTimer(wsys.waittime, [[wsys.timer.standwait = nil]])
 wsys.osend("dismount", "order " .. wsys.settings.mount .. " follow me")
end -- func


function wsys.dismountd()
 if wsys.timer.standwait then
  killTimer(tostring(wsys.timer.standwait))
  wsys.timer.standwait = nil
 end -- if
end -- func
 
