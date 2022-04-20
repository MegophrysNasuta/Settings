local menuClass = "dragon"

-- define which classes have what skills
local classSkills = {
  ["airelementallord"] = {"duress"},
  ["alchemist"] = {"alchemy", "physiology"},
  ["apostate"] = {"evileye", "necromancy", "apostasy"},
  ["bard"] = {"swashbuckling", "voicecraft", "harmonics"},
  ["blademaster"] = {"twoarts", "striking", "shindo"},
  ["druid"] = {"druid", "metamorphosis", "groves"},
  ["infernal"] = {"chivalry", "necromancy", "weaponmastery"},
  ["earthelementallord"] = {"sculpting"},
  ["fireelementallord"] = {"ignition"},
  ["jester"] = {"pranks", "puppetry", "tarot"},
  ["magi"] = {"magi", "elementalism", "crystalism"},
  ["monk"] = {"tekura", "kaido", "telepathy"},
  ["occultist"] = {"occultism", "domination", "tarot"},
  ["paladin"] = {"chivalry", "devotion", "weaponmastery"},
  ["priest"] = {"spirituality", "devotion", "healing"},
  ["psion"] = {"weaving", "psionics", "emulation"},
  ["runewarden"] = {"chivalry", "runelore", "weaponmastery"},
  ["sentinel"] = {"woodlore", "metamorphosis"},
  ["serpent"] = {"subterfuge", "hypnosis"},
  ["shaman"] = {"curses", "vodun", "runelore"},
  ["sylvan"] = {"sylvan", "groves", "elementalism"},
  ["waterelementallord"] = {"pervasion"},
  ["dragon"] = {"dragoncraft"},
  ["free"] = {"curative", "survival", "vision", "enchantment", "tattoos"},
  ["animalspirit"] = {"spiritform"},
  ["artefact"] = {"artefact"}, 
}

function wsys.defupDisplay(style, profile, class)
  if wsys.settings[style][profile][menuClass] == nil then
    wsys.settings[style][profile][menuClass] = {}
  end
  local tableName = tostring(def)
  local sortDefs = {}
  local manaUse = {
    "kaitrance", "shintrance", "projectiles", "dodging", "mindnet",
    "reflexes", "groundwatch", "vigilance", "treewatch", "telesense",
    "softfocusing", "skywatch", "hypersight", "alertness", "weaving",
  }
  local translations ={
    kaitrance = "Kai Trance",
    splitmind = "Split Mind"  ,
    shintrance = "Shin Trance",
    prismaticbarrier = "Prismatic Barrier",
    electricResistance = "ElecResistance",
  }
  -- sort defs
  for k,_ in pairs(wsys.tb.defenceTable) do
    sortDefs[#sortDefs+1] = k
  end
  table.sort(sortDefs)

  local x = 0
  for i, n in ipairs(sortDefs) do
    if wsys.classDefCheck(n, class) then
      x = x + 1
      local d = "<dark_slate_gray>[<white>"
      if wsys.settings[style][profile][menuClass][n] then
        if table.contains(manaUse, n) then
          d = d .. "<red>M" -- uses mana
        else
          d = d .. "X"
        end
      else 
        d = d .. " "
      end
      
      d = d .. "<dark_slate_gray>] <white>"     

      if (x-1)%3 == 0 then
        echo("\n")
      end 
      cecho(d)
      local nWithSpace = wsys.tb.defenceTable[n].name:title()
      if translations[n] then
        nWithSpace = translations[n]
      end
      if nWithSpace:len() < 25 and (x-1)%3~=2 then
        local pad = 25 - nWithSpace:len()
        nWithSpace = nWithSpace .. string.rep(" ", pad)
      elseif nWithSpace:len() > 25 then
        nWithSpace = nWithSpace:cut(25)
      end
      
      fg("white") 
      local command

      if configuration == nil then
        configuration = "initial"
      end

      local aliasthingy = "wconfig "..style.." "..profile.." "..menuClass.." "..n
      local command = [[expandAlias("]]..aliasthingy..[[")]]
      echoLink(nWithSpace, command, 
        "Toggle defup of " .. n, true)
      
      
      
    end
  end
  echo("\n")
end

function wsys.classDefCheck(def, class)
  local ans = false
  for k,v in pairs(classSkills[class]) do
    ans = ans or table.contains(wsys.tb.defenceTable[def]["skillset"], v)
  end
  return ans
end

function wsys.showDefMenu(style, profile ,class)
  if class then
    menuClass = string.lower(class)
  else
    menuClass = wsys.myClass()
  end
  wsys.report(string.title(style) .. " Configuration " .. profile .. " ("..menuClass..")")
  wsys.report("Class Free Defs:")
  wsys.defupDisplay(style, profile ,"free")
  wsys.report(string.title(menuClass).." Defs:")
  wsys.defupDisplay(style, profile, menuClass)
  if wsys.myClass() == "sentinel" or wsys.myClass() == "druid" then
    wsys.report("Metamorphosis animal spirits:")
    wsys.defupDisplay(style, profile ,"animalspirit")
  end
  wsys.report("Artefacts:")
  wsys.defupDisplay(style, profile, "artefact")
end

function wsys.defToggle(style, profile, class, defname)
  if wsys.settings.defup[profile][class] == nil then
    wsys.settings.defup[profile][class] = {}
  end
  if wsys.settings[style][profile][class][defname] ~= nil then
    wsys.settings[style][profile][class][defname] = nil
    wsys.report("Removed " .. defname .. " ("..wsys.tb.defenceTable[defname]["name"] ..") from " ..style.. " in " ..profile.." profile")
    wsys.showDefMenu(style, profile, class)
    -- spiritforms are not counted as defenses. So we cheat a little.
    if wsys.tb.defenceTable[defname]["skillset"][1] ~= "spiritform" then 
      send("curing priority defence " .. defname .. " reset", false)
    end
  else
    wsys.settings[style][profile][class][defname] = true
    wsys.report("Added " .. defname .. " ("..wsys.tb.defenceTable[defname]["name"] ..") to " ..style.. " in " ..profile.." profile")
    wsys.showDefMenu(style, profile, class)
    --add stuff to serverside keepup if this is displaying a keepup list.
    --Unless it's a spiritform
      if style == "keepup" and class == wsys.myClass() then
        wsys.settings.defprio[wsys.profile][wsys.myClass()][defname] = wsys.settings.defprio[wsys.profile][wsys.myClass()][defname] or 25
        -- let's not keep up a spiritform, it would cause too much trouble with the other defenses.
        if wsys.tb.defenceTable[defname]["skillset"][1] ~= "spiritform" then 
          wsys.enableSSDef( defname, wsys.settings.defprio[wsys.profile][wsys.myClass()][defname], true )
        end
      elseif style == "defup" and class == wsys.myClass() then
        if not wsys.settings.defprio[wsys.profile][wsys.myClass()][defname] then
           wsys.settings.defprio[wsys.profile][wsys.myClass()][defname] = 25
        end
      end
  end
end

function wsys.defprioDisplay()
  --init local tables
  local defpriolist = {}
  local defpriolistvals = {}
  local defpriolistsorted = {}

  --make sure defprio table exists
  if wsys.settings.defup[wsys.profile][wsys.myClass()] == nil then
    wsys.settings.defup[wsys.profile][wsys.myClass()] = {}
  end

  --snag all defup defs
  for k,v in pairs(wsys.settings.defup[wsys.profile][wsys.myClass()]) do
    defpriolist[#defpriolist+1] = k
  end
  --snag all keepup defs
  for k,v in pairs(wsys.settings.keepup[wsys.profile][wsys.myClass()]) do
    defpriolist[#defpriolist+1] = k
  end
  --check if there's a defprio table, if not make it
  if wsys.settings.defprio[wsys.profile][wsys.myClass()] == nil then
    wsys.settings.defprio[wsys.profile][wsys.myClass()] = {}
  end
  --assign prio # to all defs (25 if not set)
  for k,v in pairs(defpriolist) do
    if wsys.settings.defprio[wsys.profile][wsys.myClass()][v] then
      defpriolistvals[v] = wsys.settings.defprio[wsys.profile][wsys.myClass()][v]
    else
      defpriolistvals[v] = 25
    end
  end
  --put defs in new list to be sorted
  for index in pairs(defpriolistvals) do
    defpriolistsorted[#defpriolistsorted+1] = index
  end
  --sort defs by #
  table.sort(defpriolistsorted, function(a, b) return defpriolistvals[a] < defpriolistvals[b] end)
  
  --display results
  wsys.report("Defence Priority order:")
  for k,v in ipairs(defpriolistsorted) do
    cecho("\n<white>"..defpriolistvals[v] .. "<dodger_blue>:<white> " .. v)
    local aliasone = "wconfig defprio " .. v .. " " .. defpriolistvals[v] - 1
    local commandone = [[expandAlias("]]..aliasone..[[")]]
    echo(" ")
    echoLink("(-)", commandone, "Move 'up' " .. v, true)
    echo(" ")
    local aliastwo = "wconfig defprio " .. v .. " " .. defpriolistvals[v] + 1
    local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
    echoLink("(+)", commandtwo, "Move 'down' " .. v, true)
  end
end

function wsys.defprioset(def, prio)
  if (tonumber(prio) > 0) and (tonumber(prio) < 26) then
    wsys.settings.defprio[wsys.profile][wsys.myClass()][def] = prio
    if wsys.settings.keepup[wsys.profile][wsys.myClass()][def] then
      wsys.enableSSDef( def, prio, true )
    end
    wsys.report("Set " .. def .. " to " .. prio .. " priority.")
  else
    wsys.report("Cannot set a def lower than 1 or higher than 25 prio.")
  end
  wsys.defprioDisplay()
end
