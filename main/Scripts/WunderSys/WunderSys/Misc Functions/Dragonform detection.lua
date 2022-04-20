wsys.race = "unformed mass"

function wsys.dragonformDetection()
  if wsys.parseDragon(gmcp.Char.Status.race):lower() == "dragon" then
    wsys.dragonformed()
    if wsys.race ~= "Dragon" then
      wsys.race = "Dragon"
      wsys.dragonformedDefs()
    end
    wsys.race = "Dragon"
  else
    wsys.race = gmcp.Char.Status.race
    wsys.lesserformed()
  end
end

function wsys.dragonformed()
  --cecho("<green>dformed")
  wsys.settings.dform = true
  wsys.lostallchannels()

  if wsys.settings.affprio[wsys.profile]["dragon"] == nil then
    wsys.newclasstables("dragon")
  end
end

function wsys.lesserformed()
  wsys.settings.dform = false
  wsys.def.dragonarmour = false
  wsys.def.dragonbreath = false

  if wsys.settings.affprio[wsys.profile][wsys.myClass()] == nil then
    wsys.newclasstables(wsys.myClass())
  end
end

function wsys.dragonformedDefs()
  for k,v in pairs(wsys.def) do
    local sk = false
    if not wsys.tb.defenceTable[k] then --cecho("<red>Unknown defense for '"..k.."'\n")
      wsys.def[k] = nil
    else
      if wsys.tb.defenceTable[k]["skillset"] then sk = wsys.tb.defenceTable[k]["skillset"] end
      if not (table.contains(sk, "dragoncraft") or table.contains(sk, "tattoos") or table.contains(sk, "survival") or table.contains(sk, "vision") or table.contains(sk, "curative") or table.contains(sk, "enchantment")) then
        wsys.def[k] = false
      end
    end
  end
end

function wsys.dragonBreath( breath )
  local weapons = { acid = "black", ice = "blue", psi = "gold", venom = "green",	 dragonfire = "red", lightning = "silver" }
  if breath and weapons[breath] then
    wsys.settings.dcolor = weapons[breath]
  end
end
