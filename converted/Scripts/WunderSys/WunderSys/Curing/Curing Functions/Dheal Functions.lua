function wsys.dheal()
 enableTrigger("Dheal")
 if wsys.timer.dhealwait then
   killTimer(tostring(wsys.timer.dhealwait))
 end
 wsys.timer.dhealwait = tempTimer(wsys.myPing() * 2, [[wsys.timer.dhealwait = nil;disableTrigger("Dheal");wsys.lockqueue()]])
 wsys.doOnce("dragonheal", 5 )
end -- func

local dhealprompt = false

function wsys.dhealed()
 if wsys.timer.dhealwait then
  wsys.dhealsub()
  disableTrigger("Dheal")
  wsys.cure = "dheal"
  wsys.lostBal("dragonheal", 20)
  if dhealprompt then killTrigger(tostring(dhealprompt)) end
  if not wsys.aff.blackout then
   dhealprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptydheal() end]])
   if wsys.timer.dhealwait then
     killTimer(tostring(wsys.timer.dhealwait))
   end
   wsys.timer.dhealwait = nil
  end -- if
 end -- if
 if wsys.timer.reactivatecuring then 
   killTimer(wsys.timer.reactivatecuring)
   wsys.timer.reactivatecuring = nil
   send("curing on")
 end
end -- func


function wsys.emptydheal()
 for k,v in pairs(wsys.tb.cures.dheal) do
 	if wsysf.affs[v] then
  	wsysf.core.debug.print(2, "Empty dheal should clear ".. v.."?")
	end
  disableTrigger(string.title(v) .. " -")
 end -- for
 wsys.pairscheck("dheal")
 wsys.cure = nil
end -- func

function wsys.faileddheal()
  if wsys.timer.dhealwait then
    killTimer(tostring(wsys.timer.dhealwait))
    wsys.timer.dhealwait = nil
    wsys.cure = nil
    wsys.lostBal("dragonheal", 2)
  end
end
