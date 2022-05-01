wsys.uselyre = wsys.uselyre or false

function wsys.lyre()
 enableTrigger("Lyre +")
 if wsys.timer.lyrewait then
  killTimer(tostring(wsys.timer.lyrewait))
 end
 wsys.timer.lyrewait = tempTimer(wsys.waittime, [[wsys.timer.lyrewait = nil;wsys.addqueue("lyre")]])
 wsys.salviaSend("strum lyre")
end -- func


function wsys.lyred()
 if wsys.timer.lyrewait then
  disableTrigger("Lyre +")
  if wsys.timer.lyrewait then
   killTimer(tostring(wsys.timer.lyrewait))
  end
  wsys.timer.lyrewait = nil
  wsys.def.lyre = true
 end -- if
end -- func


function wsys.lyrelost()
 wsys.def.lyre = false
 wsys.addqueue("lyre")
end -- func
