function wsys.rage()
 enableTrigger("Rage")
 if wsys.timer.ragewait then
  killTimer(tostring(wsys.timer.ragewait))
 end
 wsys.timer.ragewait = tempTimer(wsys.myPing() * 4, [[wsys.timer.ragewait = nil;disableTrigger("Rage")]])
 wsys.salviaSend("rage")
end -- func

local rageprompt = false

function wsys.raged()
  wsys.cure = "rage"
  if not wsys.aff.blackout then
   if wsys.timer.ragewait then
    killTimer(tostring(wsys.timer.ragewait))
   end
   wsys.timer.ragewait = nil
   disableTrigger("Rage")
   wsys.lostBal("rage", 11)
   if rageprompt then killTrigger(tostring(rageprompt)) end
   rageprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptyrage() end]])
  end -- if
end -- func


function wsys.emptyrage()
 if not wsys.bals.rage then
  disableTrigger("Rage")
  if wsys.timer.ragewait then
   killTimer(tostring(wsys.timer.ragewait))
  end
  wsys.timer.ragewait = nil
  for k,v in pairs(wsys.tb.cures.rage) do
    if wsysf.affs[v] then
      wsysf.core.debug.print(2, "Empty rage should clear ".. v.."?")
    end
    disableTrigger(string.title(v) .. " -")
  end -- for
 end -- if
end -- func

function wsys.ragebalgained()
  wsys.gotBal("rage")
end

function wsys.ragedoffbal()
  lostBal("rage", 10)
end
