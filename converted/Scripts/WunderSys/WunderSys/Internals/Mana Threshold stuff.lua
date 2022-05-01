function wsys.manathreshold()
  return math.ceil(wsys.stats.maxm * wsys.settings.manapercent/100)
end

function wsys.changemanathreshold(n)
    wsys.settings.manapercent = tonumber(n)
	wsys.report("Minimum mana threshold changed to " .. wsys.settings.manapercent .. "%")
end

--check if you should be toggling mana abilities off (focus, clot etc)
function wsys.checkManaThreshold()
  --toggle focus based on threshold
  if wsys.stats.m < (wsys.manathreshold() + 250) and wsys.settings.usefocus and wsys.settings.havefocus and not wsys.settings.stopfocus then
    wsys.settings.stopfocus = true
    send("curing focus off", false)
    wsys.offfocusbalprios()
  elseif wsys.stats.m >= (wsys.manathreshold() + 250) and wsys.settings.usefocus and wsys.settings.havefocus and wsys.settings.stopfocus then
    wsys.settings.stopfocus = false
    send("curing focus on", false)
    wsys.onfocusbalprios()
  end
  --toggle insomnia based on threshold
  if wsys.stats.m < (wsys.manathreshold() + 100) and wsys.settings.useinsomnia and wsys.settings.haveinsomnia and not wsys.settings.stopinsomnia then
    wsys.settings.stopinsomnia = true
    send("curing insomnia off", false)
  elseif wsys.stats.m >= (wsys.manathreshold() + 100) and wsys.settings.useinsomnia and wsys.settings.haveinsomnia and wsys.settings.stopinsomnia then
    wsys.settings.stopinsomnia = false
    send("curing insomnia on", false)
  end
  --toggle clot based on threshold
  if wsys.stats.m < (wsys.manathreshold() + 100) and wsys.settings.useclot and wsys.settings.haveclot and not wsys.settings.stopclot then
    wsys.settings.stopclot = true
    send("curing clotat " .. tostring(wsys.stats.maxh + 5000), false)
  elseif wsys.stats.m >= (wsys.manathreshold() + 100) and wsys.settings.useclot and wsys.settings.haveclot and wsys.settings.stopclot and not wsys.aff.corruption then
    wsys.settings.stopclot = false
    send("curing clotat 30", false)
  end
end
