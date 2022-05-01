function wsys.onAmnesiaCheck(event, affliction)
  if event == "got aff" and affliction == "amnesia" then
    if not wsys.paused and not wsys.softpaused then
    	send("touch flaws", false)
    end -- if
  end
end

if wsys.events.on_amnesia then killAnonymousEventHandler( wsys.events.on_amnesia ) end
wsys.events.on_amnesia = registerAnonymousEventHandler("got aff", "wsys.onAmnesiaCheck")
