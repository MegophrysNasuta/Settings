if wsys.curingstatuscheck then deleteLine()
wsys.report("Finished checking Curing Status")
end
if matches[2] == "No" then
  if wsys.settings.haveinsomnia then
    wsys.settings.useinsomnia = true
    wsys.settings.stopinsomnia = false
    send("curing insomnia on", false)
  end
elseif matches[2] == "Yes" then
  if not wsys.settings.haveinsomnia then
    wsys.settings.useinsomnia = false
    wsys.settings.stopinsomnia = false
    send("curing insomnia off", false)
  end
end
