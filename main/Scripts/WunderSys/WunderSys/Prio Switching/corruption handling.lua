function wsys.corruptionhandling(event, affliction)
  if event == "got aff" then
    if affliction == "corruption" and wsys.classTimerExists("alchemist") then
      wsys.settings.stopclot = true
      send("curing clotat " .. tostring(wsys.stats.maxh + 5000), false)
    end
  elseif event == "lost aff" then
    if affliction == "corruption" and wsys.stats.m >= (wsys.manathreshold() + 100) and wsys.settings.useclot and wsys.settings.haveclot and wsys.settings.stopclot then
      wsys.settings.stopclot = false
      send("curing clotat 30", false)
    end
  end
end

registerAnonymousEventHandler("got aff", "wsys.corruptionhandling")
registerAnonymousEventHandler("lost aff", "wsys.corruptionhandling")
