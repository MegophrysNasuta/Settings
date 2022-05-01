if wsys.curingstatuscheck then deleteLine() end
if matches[2] == "No" then
  if wsys.settings.havefocus then
    wsys.settings.usefocus = true
    wsys.settings.stopfocus = false
    send("curing focus on", false)
  else
    wsys.settings.usefocus = false
    wsys.settings.stopfocus = false
  end
elseif matches[2] == "Yes" then
  if not wsys.settings.havefocus then
    wsys.settings.usefocus = false
    wsys.settings.stopfocus = false
    send("curing focus off", false)
  else
    wsys.settings.usefocus = true
    wsys.settings.stopfocus = false
  end
end
