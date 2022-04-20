wsys.channels = {
  ["fire"] = false,
  ["earth"] = false,
  ["air"] = false,
  ["water"] = false,
  ["spirit"] = false,
}

function wsys.lostallchannels()
  wsys.channels.fire = false
  wsys.channels.earth = false
  wsys.channels.air = false
  wsys.channels.water = false
  wsys.channels.spirit = false
end

function wsys.missingChannels()
  local c = 0
  if not wsys.channels.fire then c = c + 1 end
  if not wsys.channels.earth then c = c + 1 end
  if not wsys.channels.air then c = c + 1 end
  if not wsys.channels.water then c = c + 1 end
  if wsys.isClass("priest") and not wsys.channels.spirit then c = c + 1 end

  return c
end

function wsys.defChannels()
  if wsys.settings.havesimultaneity and wsys.missingChannels() > 2 then
    wsys.doadd("simultaneity")
  else
    if not wsys.channels.fire then wsys.doadd("channel fire") end
    if not wsys.channels.earth then wsys.doadd("channel earth") end
    if not wsys.channels.air then wsys.doadd("channel air") end
    if not wsys.channels.water then wsys.doadd("channel water") end
    if wsys.isClass("priest") and not wsys.channels.spirit then wsys.doadd("channel spirit") end
  end

end
