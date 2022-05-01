function wsys.loggedIn()
  gmod.enableModule("Wunder Support Target", "IRE.Target")
  gmod.enableModule("Wunder Support Time", "IRE.Time")
  wsys.abilityCheck()
  wsys.setkeepouttable()
  wsys.outrqueue()
	wsys.checkCuringSets()
  wsys.resetAffPrios()
  wsys.checkForUpdates()
  wsys.def = {}
  send("pipelist")
  send("curing batch on", false)
  --if wsys.settings.class == "" then wsys.settings.class = gmcp.Char.Status.class end
  --if wsys.settings.defprio[wsys.profile][wsys.myClass()] == nil then wsys.settings.defprio[wsys.profile][wsys.myClass()] = {} end
  raiseEvent("logged in")
end

function wsys.enableLoginTrigger()
  enableTrigger("Logged in")
end

registerAnonymousEventHandler("sysConnectionEvent", "wsys.enableLoginTrigger")
