function wsys.resetAffPrios()
  if wsys.settings.curingsets == "true" then
    wsys.cloneDefaultCuringSet()
  else
    for k,v in pairs(wsys.settings.affprio[wsys.profile][wsys.myClass()]) do
      -- reset affs that aren't at their setting position
      if wsys.affPosition(k) ~= wsys.defaultAffPosition(k) then
      send("curing priority " .. k .. " " .. tostring(v), false)
      end
    end
  end
  raiseEvent("reset aff prios")
end

function wsys.resetAllAffPrios()
  if wsys.settings.curingsets == "true" then
    wsys.cloneDefaultCuringSet()
  else
    for k,v in pairs(wsys.settings.affprio[wsys.profile][wsys.myClass()]) do
      send("curing priority " .. k .. " " .. tostring(v), false)
    end
  end
  raiseEvent("reset aff prios")
end

wsys.afflictionPrioritiesCurrent = wsys.afflictionPrioritiesCurrent or {}

-- If higher_only == true, then only allow shifting to higher priorities (e.g. 5->2 but not 2->5)
function wsys.switchPrios( aff, pos, higher_only )
  if not (wsys.afflictionPrioritiesCurrent[aff] == pos) then
    if not higher_only or not wsys.afflictionPrioritiesCurrent[aff] or pos < wsys.afflictionPrioritiesCurrent[aff] then
    	send("curing priority " .. aff .. " " .. tostring(pos), false)
    end
  end
end

function wsys.affPrioChanged( aff, pos )
	wsys.afflictionPrioritiesCurrent[aff] = pos
end

function wsys.affPrioRestore( aff )
	if not wsys.afflictionPrioritiesCurrent[aff] or wsys.afflictionPrioritiesCurrent[aff] ~= wsys.defaultAffPosition(aff) then
		send("curing priority " .. aff .. " " .. tostring(wsys.defaultAffPosition(aff)), false)
	end
end

function wsys.affPosition(affliction)
  local affSpot = 25
  if table.contains(wsys.afflictionPrioritiesCurrent, affliction) then
    affSpot = wsys.afflictionPrioritiesCurrent[affliction]
  else
    affSpot = wsys.defaultAffPosition(affliction)
  end
  return affSpot
end

function wsys.defaultAffPosition(affliction)
  return wsys.settings.affprio[wsys.profile][wsys.myClass()][affliction]
end


function wsys.targettedCure(c)
  return table.contains(wsys.tb.targettedCureTable, c)
end



function wsys.affprioset(aff, num, profile, class)
  local p = wsys.profile
  local cl = wsys.myClass()
  if profile then p = profile end
  if class then cl = class end
  if table.contains(wsys.tb.affc, aff) then
    if tonumber(num) >= 1 and tonumber(num) <= 26 then
      wsys.settings["affprio"][p][cl][aff] = tonumber(num)
      wsys.report("Set " .. aff .. " to " .. tostring(num) .. " priority for " .. p .. " ("..cl..")")
      wsys.saveSettings()
      wsys.postchangeaffpriodisplay(aff)
    else
      wsys.report("Cannot set a number lower than 1 or higher than 26!")
    end
  else
    --invalid fucking aff right here son
    wsys.report(aff .. " is not a valid affliction!")
  end
end

