function wsys.focus()
 send("curing queue remove focus")
 send("curing queue add focus")
end -- func


function wsys.focusbal()
 wsys.focusbalsub()
 wsys.gotBal("focus")
 disableTrigger("FocusBalance")
end -- func

local focusprompt = false

function wsys.focused()
  wsys.cure = "focus"
  wsys.focussub()
  enableTrigger("FocusBalance")
  if wsys.aff.weakenedmind then
    cecho("<red>Longer focus balance RIXIL")
    wsys.lostBal("focus", 7.7)
  else
    wsys.lostBal("focus", 3.8)
  end
  if focusprompt then killTrigger(tostring(focusprompt)) end
  if not wsys.aff.blackout then
   focusprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptyfocus() end]])
  end -- if
end -- func


function wsys.emptyfocus()
 if wsys.stats.m < wsys.stats.om then
   for k,v in pairs(wsys.tb.cures.focus) do
     wsys.predicted[v] = nil
     if wsysf.affs[v] then
       wsysf.core.debug.print(2, "Empty focus should clear ".. v.."?")
     end
     disableTrigger(string.title(v) .. " -")
   end -- for
   wsys.pairscheck("focus")
 end -- if
 wsys.cure = nil
end -- func


function wsys.focusAffCount()
  local fCount = 
    wsysf.affv.stupidity +
    wsysf.affv.epilepsy +
    wsysf.affv.dizziness +
    wsysf.affv.shyness +
    wsysf.affv.recklessness +
    wsysf.affv.masochism +
    wsysf.affv.loneliness +
    wsysf.affv.claustrophobia +
    wsysf.affv.agoraphobia +
    wsysf.affv.vertigo +
    wsysf.affv.confusion +
    wsysf.affv.anorexia +
    wsysf.affv.dementia +
    wsysf.affv.paranoia +
    wsysf.affv.hallucinations
  
  return fCount
end

function wsys.hasFocusAffs()
  if wsys.focusAffCount() == 0 then
    return false
  else
    return true
  end
end

function wsys.hasDisruptedElement()
  return wsys.aff.waterdisrupt or wsys.aff.airdisrupt or wsys.aff.firedisrupt or wsys.aff.earthdisrupt
end
