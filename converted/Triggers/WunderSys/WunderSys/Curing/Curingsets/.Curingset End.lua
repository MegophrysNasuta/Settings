deleteFull()
disableTrigger("Curingset Parse")
disableTrigger("Curingset End")
disableTrigger("Curingset None")

if not (wsys.curingSets.wundersys ~= nil and wsys.curingSets.wundersys_default ~= nil) then
  if tonumber(matches[3]) >= (tonumber(matches[2]) + 2) then
    wsys.addCuringSets()
  else
    wsys.report("You need two curing sets free to set up WunderSys! Please ensure you have two free and reconnect to the game.") 
  end
else
	wsys.setSettings("curingsets", "true")
end
