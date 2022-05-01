-- Set the prefixWarning that gets used in the @warning prompt tag

wsys.prefixWarning = ""

function wsys.setPrefixWarning(message, duration, key)
  wsys.prefixWarning = "<MediumVioletRed>{!" .. message .. "!}"
	wsys.prefixWarningKey = key
  if wsys.timer.prefixWarningTimer then killTimer(wsys.timer.prefixWarningTimer) end
  wsys.timer.prefixWarningTimer = tempTimer(duration, [[wsys.timer.prefixWarningTimer = nil;wsys.prefixWarning = ""]])
end

function wsys.clearPrefixWarning(key)
	if wsys.prefixWarningKey == key then
		if wsys.timer.prefixWarningTimer then killTimer(wsys.timer.prefixWarningTimer) end
			wsys.timer.prefixWarningTimer = nil
			wsys.prefixWarning = ""
	end
end
