function wsys.checkCuringSets()
  wsys.curingsets = {}
	send("CURINGSET LIST")
  enableTrigger("Curingset Begin")
	enableTrigger("Curingset None")
end

function wsys.addCuringSets()
  send("CURINGSET NEW wundersys")
	send("CURINGSET NEW wundersys_default")
	send("CURINGSET SWITCH wundersys_default")
	if wsys.settings.curingsets ~= "true" then
	  wsys.setSettings("curingsets", "true" )
	end
	wsys.resetAffPrios()
	tempTimer(1.5, function()
		send("CURINGSET SWITCH WUNDERSYS")
		wsys.cloneDefaultCuringSet()
		end)
end

function wsys.cloneDefaultCuringSet()
	send("CURINGSET CLONE wundersys_default")
end
