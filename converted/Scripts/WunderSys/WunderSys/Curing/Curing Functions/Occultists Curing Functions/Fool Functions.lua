function wsys.fool()
 enableTrigger("Fool")
 if wsys.timer.foolwait then
   killTimer(tostring(wsys.timer.foolwait))
 end
 wsys.timer.foolwait = tempTimer(wsys.waittime, [[wsys.timer.foolwait = nil;disableTrigger("Fool");wsys.lockqueue()]])
 wsys.salviaSend("outd fool", "charge fool", "fling fool at me")
end -- func

local foolprompt = false

function wsys.fooled()
 if wsys.timer.foolwait then
--  foolsub()
  wsys.lostBal("fool", 62)
  wsys.cure = "fool"
  if foolprompt then killTrigger(tostring(foolprompt)) end
  if not wsys.aff.blackout then
   if wsys.timer.foolwait then
    killTimer(tostring(wsys.timer.foolwait))
   end
   wsys.timer.foolwait = nil
   foolprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptyfool() end]])
  end -- if
 end -- if
end -- func


function wsys.emptyfool()
 for k,v in pairs(wsys.tb.cures.fool) do
  if wsysf.affs[v] then
   wsysf.core.debug.print(2, "Empty fool should clear ".. v.."?")
 end
  disableTrigger(string.title(v) .. " -")
 end -- for
 wsys.pairscheck("dheal")
 wsys.cure = nil
end -- func


function wsys.foolbal(event, bal)
 if event == "got bal" and bal == "fool" then
   disableTrigger("Fool")
   wsys.lockqueue()
 end
end -- func

registerAnonymousEventHandler("got bal", "wsys.foolbal")
