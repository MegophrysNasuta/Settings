function wsys.gainedb( display_diff )
wsys.times.bals.got.b = getTime(true, "HH:mm:ss:zzz" )
raiseEvent("got balance")
--cecho("<green>got balance")
local lost_time = wsys.times.bals.lost.b
wsys.bals.b = true
wsys.gotBalanceValue(gmcp.Char.Vitals.bal)
wsys.lockqueue()
if wsys.bals.e then
 wsys.refillqueue()
 wsys.canaction()
end -- if
wsys.lyrequeue()

if display_diff then
  local balanceTime = wsys.timeDifference(wsys.times.bals.got.b, lost_time) / 1000
  cecho("<grey> " .. balanceTime .. "s")
end
end -- func

function wsys.gainede( display_diff )
 wsys.times.bals.got.e = getTime(true, "HH:mm:ss:zzz" )
 raiseEvent("got equilibrium")
 wsys.bals.e = true
 local lost_time = wsys.times.bals.lost.e
 wsys.gotEquilibriumValue( gmcp.Char.Vitals.eq )
 if wsys.bals.e and wsys.vmode then wsys.unignoreRestoBreaks() end
 if wsys.bals.b then
  wsys.lockqueue()
  wsys.refillqueue()
  wsys.canaction()
 end -- if
 if wsys.aff.disrupted then wsys.aff.disrupted = nil end
 wsys.lyrequeue()

 if display_diff then
   local eqTime = wsys.timeDifference(wsys.times.bals.got.e, lost_time) / 1000
   cecho("<grey> " .. eqTime .. "s")
 end

end -- func


function wsys.lostb()
 --cecho("<red>lost balance")
 wsys.times.bals.lost.b = getTime(true, "HH:mm:ss:zzz" )
 raiseEvent("lost balance")
end -- func

function wsys.loste()
 wsys.times.bals.lost.e = getTime(true, "HH:mm:ss:zzz" )
 raiseEvent("lost equilibrium")
end -- func

function wsys.gotBalanceValue(v)
  if wsys.bals.b and v == "0" then
    wsys.bals.b = false
    wsys.lostb()
  elseif not wsys.bals.b and v == "1" then
    wsys.bals.b = true
  elseif wsys.bals.b and v == "1" then
    wsys.bals.b = true
  elseif not wsys.bals.b and v == "0" then
    wsys.bals.b = false
  end
end

function wsys.gotEquilibriumValue(v)
  if wsys.bals.e and v == "0" then
    wsys.bals.e = false
    wsys.loste()
  elseif not wsys.bals.e and v == "1" then
    wsys.bals.e = true
  elseif v == "1" then
    wsys.bals.e = true
  elseif v == "0" then
    wsys.bals.e = false
  end
end

function wsys.vitalsUpdate()
  if gmcp.Char.Vitals then
    wsys.gotEquilibriumValue(gmcp.Char.Vitals.eq)
    wsys.gotBalanceValue(gmcp.Char.Vitals.bal)
  end
end

registerAnonymousEventHandler("gmcp.Char", "wsys.vitalsUpdate")


