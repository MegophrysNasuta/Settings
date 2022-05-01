function wsys.kelpVsGinseng()
  local ginsengs = wsys.affamount("ginseng")
  local kelps = wsys.affamount("kelp")
  if wsys.classTimerExists("shaman") and not wsys.classTimerExists("serpent") then
    if ginsengs > kelps then
      --move haemophilia to same spot as paralysis if ginseng stacked
      --wsys.switchPrios( "haemophilia", wsys.affPosition("paralysis") )
    elseif kelps > ginsengs then
      --move haemophilia down if not
      wsys.affPrioRestore( "haemophilia" )
    end
  elseif wsys.classTimerExists("serpent") and not wsys.classTimerExists("shaman") then

  elseif wsys.classTimerExists("apostate") then

  end
end

registerAnonymousEventHandler("got aff", "wsys.kelpVsGinseng")
