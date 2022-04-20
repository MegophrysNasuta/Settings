wsys.fullstats = wsys.fullstats or false
wsys.fullstatsaction = wsys.fullstatsaction or false

function wsys.set_fullstatsaction(ac)
  wsys.fullstatsaction = ac
end

function wsys.clear_fullstatsaction()
  wsys.fullstatsaction = false
end

function wsys.fullstatsf(ac)
  if ac then
    wsys.set_fullstatsaction(ac)
  end
  wsys.fullstats = true
  send("curing siphealth 99", false)
  send("curing sipmana 99", false)
end

function wsys.fullstatsHandler()
  if wsys.fullstats then
    local healthp = wsys.stats.h/wsys.stats.maxh * 100
    local manap = wsys.stats.m/wsys.stats.maxm * 100
    if healthp >= 99 and manap >= 99 then
      wsys.fullstats = false
      send("curing siphealth " .. wsys.settings.siphealth, false)
      send("curing sipmana " .. wsys.settings.sipmana, false)
      if wsys.fullstatsaction then
        wsys.osend(wsys.fullstatsaction)
        wsys.clear_fullstatsaction()
      end
    end
  end
end

registerAnonymousEventHandler("gmcp.Char.Vitals", "wsys.fullstatsHandler")
registerAnonymousEventHandler("gmcp.Char.Vitals", "wsys.fullstatsHandler")
