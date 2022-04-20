-- OSEND
function wsys.osend(...)
 if not wsys.paused and not wsys.softpaused and not wsys.aff.aeon and (not wsys.uselyre or (not wsys.def.lyre and not wsys.timer.lyrewait)) then
  wsys.salviaSend(...)
 end -- if
end -- func

-- PSEND
function wsys.psend(...)
 if not wsys.paused and not wsys.softpaused and not wsys.aff.aeon then
  send("pt " .. ...)
 end -- if
end -- func

-- CAN CURE
function wsys.cancure()
 if not wsys.paused and not wsys.softpaused and not wsys.aff.aeon and not wsys.retard and (not wsys.uselyre or (not wsys.def.lyre and not wsys.timer.lyrewait)) and not wsys.aff.sleeping then
  return true
 else
  return false
 end -- if
end -- func

--is slowed
function wsys.isslowed()
  if wsys.aff.aeon and wsys.retard then return true else return false end
end --func


function wsys.damagedarms()
 if (wsys.aff.brokenleftarm or wsys.aff.damagedleftarm or wsys.aff.mangledleftarm) and (wsys.aff.brokenrightarm or wsys.aff.damagedrightarm or wsys.aff.mangledrightarm) then
  return true
 else
  return false
 end -- if
end -- func


function wsys.damagedlegs()
 if wsys.aff.brokenleftleg or wsys.aff.damagedleftleg or wsys.aff.mangledleftleg or wsys.aff.brokenrightleg or wsys.aff.damagedrightleg or wsys.aff.mangledrightleg then
  return true
 else
  return false
 end -- if
end -- func 

function wsys.bothdamagedlegs()
if (wsys.aff.brokenleftleg or wsys.aff.damagedleftleg or wsys.aff.mangledleftleg) and (wsys.aff.brokenrightleg or wsys.aff.damagedrightleg or wsys.aff.mangledrightleg) then
 return true
else
 return false
end -- if
end -- func

--am I hindered
function wsys.isHindered()
  return (wsys.damagedarms() or wsys.tanglecheck() or wsys.impaled() or wsys.aff.paralysis or wsys.aff.prone or false)
end


-- returns number of affs you have for a certain cure
-- useful to find out if you're kelp stacked etc
function wsys.affamount(cure)
  local c = 0
  for k,v in pairs(wsys.tb.cures[cure]) do
	  c = c + wsysf.affv[v]
  end
  return c
end


-- DELETE FULL
-- overwrites default function, does NOT belong in wsys namespace
function deleteFull()
 if wsys.deletefull_id then killTrigger( wsys.deletefull_id ) end
 wsys.deletefull_id = tempLineTrigger(1,1,[[if not isPrompt() then 
  wsys.deletefull = false
  wsys.deletefull_id = nil
 end]])
 deleteLine()
 wsys.deletefull = true
end -- func

-- OUTRIFT CHECK
function wsys.outriftcheck()
 if not wsys.tanglecheck() and not wsys.damagedarms() then
  return true
 else
  return false
 end -- if
end -- func


-- TANGLE CHECK
function wsys.tanglecheck()
 if wsys.impaled() or wsys.aff.webbed or wsys.aff.entangled or wsys.aff.bound or wsys.aff.transfixation then
  return true
 else
  return false
 end -- if
end -- func


function wsys.impaled()
 if wsys.aff.impaled or wsys.aff.daeggerimpale or wsys.aff.speared then
  return true
 else
  return false
 end -- if
end -- func


function wsys.cleartimers()
 local timers = {}
 for k,v in pairs(wsys.timer) do
  if string.match(k, "wait") then
   killTimer(tostring(v))
   timers[#timers+1] = k
  end -- if
 end -- for
 if next(timers) then
  for k in pairs(wsys.timer) do
   wsys.timer[k] = nil
  end -- for
 end -- if
end -- func
