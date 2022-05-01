if wsys.curingstatuscheck then deleteLine() end
if matches[2] == "Transmutation" and not wsys.settings.usetransmutation then
  send("curing transmutation off", false)
  wsys.report("Switching to concoction cures as set in settings.")
elseif matches[2] == "Concoctions" and wsys.settings.usetransmutation then
  send("curing transmutation on", false)
  wsys.report("Switching to transmutation cures as set in settings.")
end


