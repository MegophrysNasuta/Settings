function wsys.restore()
 enableTrigger("Restore")
 if wsys.timer.restorewait then
  killTimer(tostring(wsys.timer.restorewait))
 end
 wsys.timer.restorewait = tempTimer(wsys.myPing() * 2, [[wsys.timer.restorewait = nil;disableTrigger("Restore");wsys.lockqueue()]])
 wsys.doOnce("restore", 5)
end -- func

local restoreprompt = false

function wsys.restored()
 if wsys.timer.restorewait then
  if wsys.vmode then wsys.ignoreRestoBreaks() end
  wsys.restoresub()
  disableTrigger("Restore")
  wsys.cure = "restore"
  if restoreprompt then killTrigger(tostring(restoreprompt)) end
  if not wsys.aff.blackout then
   if wsys.timer.restorewait then
    killTimer(tostring(restorewait))
   end
   wsys.timer.restorewait = nil
   restoreprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptyrestore() end]])
  end -- if
 end -- if
end -- func


function wsys.emptyrestore()
 for k,v in pairs(wsys.tb.cures.restore) do
    wsys.predicted[v] = nil
	
    if wsysf.affs[v] then
      wsysf.core.debug.print(2, "Empty restore should clear ".. v.."?")
    end
  disableTrigger(string.title(v) .. " -")
 end -- for
 wsys.pairscheck("restore")
 wsys.cure = nil
end -- func

function wsys.ignoreRestoBreaks()
  wsys.report("Ignoring restoration breaks")
  wsys.switchPrios( "damagedleftleg", 26 )
  wsys.switchPrios( "damagedrightleg", 26 )
  wsys.switchPrios( "mangledleftleg", 26 )
  wsys.switchPrios( "mangledrightleg", 26 )
  wsys.switchPrios( "damagedleftarm", 26 )
  wsys.switchPrios( "damagedrightarm", 26 )
  wsys.switchPrios( "mangledleftarm", 26 )
  wsys.switchPrios( "mangledrightarm", 26 )
  wsys.switchPrios( "damagedhead", 26 )
  wsys.switchPrios( "mangledhead", 26 )
end


function wsys.unignoreRestoBreaks()
  wsys.report("Resume curing resto breaks")
  wsys.affPrioRestore( "damagedleftleg" )
  wsys.affPrioRestore( "damagedrightleg" )
  wsys.affPrioRestore( "mangledleftleg" )
  wsys.affPrioRestore( "mangledrightleg" )
  wsys.affPrioRestore( "damagedleftarm" )
  wsys.affPrioRestore( "damagedrightarm" )
  wsys.affPrioRestore( "mangledleftarm" )
  wsys.affPrioRestore( "mangledrightarm" )
  wsys.affPrioRestore( "damagedhead" )
  wsys.affPrioRestore( "mangledhead" )
end
