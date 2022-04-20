wsys.bleeding = 0
wsys.bleedtype = "health"

function wsys.clot()
 if wsys.timer.clotwait then
  killTimer(tostring(wsys.timer.clotwait))
 end
 wsys.timer.clotwait = tempTimer(wsys.myPing() * 2, [[wsys.timer.clotwait = nil;wsys.addqueue("clot")]])
 wsys.salviaSend("clot", false)
end -- func

function wsys.clotd()
  if wsys.bleeding <= 30 then
    wsys.bleeding = 0
  else
    wsys.bleeding = wsys.bleeding - 30
  end
  
  wsys.clotqueue()
end -- func

function wsys.clotcure()
  wsys.timer.bleedingTimer = nil
  wsys.cure = "clot"
  wsys.bleeding = 0
  if wsys.timer.bleedingTimer then
   killTimer(wsys.timer.bleedingTimer)
   wsys.timer.bleedingTimer = nil
  end
end -- func

function wsys.bleedingfor(amount, type)
  --[=[wsys.affadd("bleeding")
  wsys.bleeding = tonumber(amount)
  wsys.bleedtype = tostring(type)
  if wsys.timer.bleedingTimer then
   killTimer(wsys.timer.bleedingTimer)
  end
  wsys.timer.bleedingTimer = tempTimer(15, [[wsys.timer.bleedingTimer = nil;wsys.clotcure()]])]=]
end --func

--clots as much as you will allow according to your mana threshold.
function wsys.maxclot()

  local manaleft = wsys.stats.m - wsys.manathreshold()
  local clotnum = 0
  local aliasstring = ""

  if wsys.settings.magirobes then
    clotnum = math.floor((manaleft-100)/40)
  else
    clotnum = math.floor((manaleft-100)/60)
  end

  if clotnum > 0 then
    aliasstring = "clot"
    clotnum = clotnum - 1
  end

  while clotnum > 0 do
    aliasstring = aliasstring .. "/clot"
    clotnum = clotnum - 1
  end

  send("setalias maxclot " .. aliasstring)
  send("maxclot")

end
