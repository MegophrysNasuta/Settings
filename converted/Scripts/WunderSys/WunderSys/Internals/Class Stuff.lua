--checks if you are a certain class, for example wsys.isClass("monk")
function wsys.isClass(class)
  --return not wsys.isDragon() and (gmcp.Char.Status.class == string.title(class))
  return class == wsys.myClass()
end

function wsys.isDragon()
  return wsys.settings.dform
end

function wsys.parseDragon( str )
  local color = str:match("(%w+) Dragon")
  if color then wsys.settings.dcolor = color:lower() end
  return color and "dragon" or str:gsub("%s+", ""):lower()
end

--returns your class as a string
function wsys.myClass()
  if wsys.isDragon() then
    return "dragon"
  else
    return string.lower(wsys.settings.class or "none")
  end
end

function wsys.isKnight()
  return wsys.isClass("runewarden") or wsys.isClass("infernal") or wsys.isClass("paladin")
end


function wsys.isFitnessClass()
  return not wsys.isDragon() and (wsys.isClass("monk") or wsys.isClass("blademaster") or wsys.isClass("infernal") or wsys.isClass("paladin") or wsys.isClass("runewarden"))
end

function wsys.changedClass()
 if (wsys.parseDragon(gmcp.Char.Status.class) ~= wsys.settings.class) or (wsys.parseDragon(gmcp.Char.Status.race):lower() ~= wsys.race:lower()) then
  if wsys.parseDragon(gmcp.Char.Status.class) == "dragon" and wsys.parseDragon(gmcp.Char.Status.race) ~= "dragon" then
    --Dragon class but not race. We lesserformed, but class didn't update. Check score
    send("score", false )
    return
  end
  --cecho("<red>CHANGED CLASS")
  local old_class = wsys.myClass()
  wsys.settings.class = wsys.parseDragon(gmcp.Char.Status.class)
  wsys.dragonformDetection() --This will ensure the profile tables exist

  if old_class ~= wsys.myClass() then
    -- Reset all defences that were in keepup of the previous class
    for k in pairs( table.union( wsys.settings.keepup[wsys.profile][old_class], wsys.settings.defup[wsys.profile][old_class] ) ) do
      if not wsys.settings.keepup[wsys.profile][wsys.myClass()][k] then
        send("curing priority defence " .. k .. " reset", true)
      end
    end
    wsys.switchProfile( wsys.profile )
  end
 end
end

registerAnonymousEventHandler("gmcp.Char.Status", "wsys.changedClass")

function wsys.newclasstables(cl)
  wsys.settings.defup[wsys.profile][cl] = {}
  wsys.settings.defprio[wsys.profile][cl] = {}
  wsys.settings.keepup[wsys.profile][cl] = {}
  wsys.settings.focusshifts[wsys.profile][cl] = wsys.return_defaultfocusshifts()
  wsys.settings.affprio[wsys.profile][cl] = wsys.return_defaultaffprios()
end
