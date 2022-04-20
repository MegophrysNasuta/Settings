if matches[2] == "on" then
  wsys.setSettings("usemoss", "true")
  wsys.report("Will use moss")
  wsys.mossThreshholdDown()
elseif matches[2] == "off" then
  wsys.setSettings("usemoss", "false")
  wsys.report("Won't use moss")
  send("curing mosshealth 0", false)
  send("curing mossmana 0", false)
end
