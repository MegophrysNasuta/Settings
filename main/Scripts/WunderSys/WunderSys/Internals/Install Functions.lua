function wsys.wunderSysInstall()
  wsys.wunderSysSetPrompt()
  wsys.wunderSysCuringInstall()
end

function wsys.wunderSysSetPrompt()
  send("config prompt all")
end

function wsys.wunderSysCuringInstall()
  send("config screenwidth 0")
  send("curing on")
  send("curing afflictions on")
  send("config advancedcuring on")
  send("curing batch on")
  send("curing priority health")
  send("curing reporting on")
  send("curing siphealth 80")
  send("curing sipmana 80")
  send("curing mosshealth 70")
  send("curing mossmana 70")
  send("curing clotat 30")
end
