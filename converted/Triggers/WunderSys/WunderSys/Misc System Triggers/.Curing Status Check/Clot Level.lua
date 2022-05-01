if wsys.curingstatuscheck then deleteLine() end

if matches[2] == "No" then
  -- have clot disabled on serverside curing
  if wsys.settings.haveclot then
    send("curing clotat 30", false)
    send("curing clot on", false)
  end
elseif tonumber(matches[2]) > wsys.stats.maxh then
  if wsys.settings.haveclot then
    wsys.settings.useclot = true
    wsys.settings.stopclot = false
    send("curing clotat 30", false)
  end
else
  if not wsys.settings.haveclot then
    wsys.settings.useclot = false
    wsys.settings.stopclot = false
    send("curing clotat ".. tostring(wsys.stats.maxh + 5000), false)
  end
end
