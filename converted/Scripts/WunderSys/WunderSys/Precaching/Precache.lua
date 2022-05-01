local minerals = {"antimony", "argentum", "arsenic", "aurum", "azurite", "bisemutum", "calamine", "calcite", "cinnabar", "cuprum", "dolomite", "ferrum", "gypsum", "magnesium", "malachite", "plumbum", "potash", "quartz", "quicksilver", "realgar", "stannum"}
local herbs = {"ash", "bayberry", "bellwort", "bloodroot", "cohosh", "elm", "ginger", "ginseng", "goldenseal", "hawthorn", "kelp", "kola", "lobelia", "skullcap", "valerian", "sileris", "moss", "pear"}

wsys.keepout = wsys.keepout or {}

function wsys.setkeepouttable()
  wsys.settings.precache = wsys.settings.precache or {}
  wsys.settings.precache[wsys.profile] = wsys.settings.precache[wsys.profile] or {}
  --Clear the entire table
  wsys["keepout"] = {}
  for k,v in pairs(wsys.settings["precache"][wsys.profile]) do
    wsys["keepout"][k] = v
  end
end

function wsys.precacheset(herb, num, profile)
  local p = wsys.profile
  if profile then p = profile end
  if (table.contains(minerals, herb) or table.contains(herbs, herb)) then
    if tonumber(num) > 0 then
      wsys.settings["precache"][p][herb] = tonumber(num)
      wsys.precachedisplay()
      wsys.setkeepouttable()
      wsys.outrqueue()
      wsys.saveSettings()
    elseif tonumber(num) == 0 then
      wsys.settings["precache"][p][herb] = nil
      wsys.precachedisplay()
      wsys.setkeepouttable()
      wsys.outrqueue()
      wsys.saveSettings()
    else
      wsys.report("Cannot set a number lower than 0!")
    end
  else
    --invalid fucking herb right here son
    wsys.report(herb .. " is not a valid herb or mineral!")
  end
end

function wsys.precachedisplay()
  wsys.report("Precached Herbs/Minerals")
  if wsys.settings["precache"][wsys.profile] == nil then
    wsys.settings["precache"][wsys.profile] = {}
  end
  local minerals = {"antimony", "argentum", "arsenic", "aurum", "azurite", "bisemutum", "calamine", "calcite", "cinnabar", "cuprum", "dolomite", "ferrum", "gypsum", "magnesium", "malachite", "plumbum", "potash", "quartz", "quicksilver", "realgar", "stannum"}
  local herbs = {"ash", "bayberry", "bellwort", "bloodroot", "cohosh", "elm", "ginger", "ginseng", "goldenseal", "hawthorn", "kelp", "kola", "lobelia", "skullcap", "valerian", "sileris", "moss", "pear"}
  if wsys.settings.usetransmutation then
    local x = 0
    for k,v in ipairs(minerals) do
      x = x + 1
      local num = 0
      if wsys.settings["precache"][wsys.profile][v] then
        num = wsys.settings["precache"][wsys.profile][v]
      end
      local d = "<dark_slate_gray>[<white>" .. num .. "<dark_slate_gray>] <white>"
      if (x-1)%3 == 0 then
        echo("\n")
      end
      cecho(d)
      local nWithSpace = v
      local length = nWithSpace:len() + math.floor(math.log10(math.max(1,num)))
      if length < 25 and (x-1)%3~=2 then
        local pad = 25 - length
        nWithSpace = string.rep(" ", pad)
      else
        nWithSpace = ""
      end
      cecho("<white>"..v)
      local aliasone = "wconfig precache " .. v .. " " .. num + 1
      local commandone = [[expandAlias("]]..aliasone..[[")]]
      echo(" ")
      echoLink("(+)", commandone, "Add one more " .. v, true)
      echo(" ")
      local aliastwo = "wconfig precache " .. v .. " " .. num - 1
      local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
      echoLink("(-)", commandtwo, "Remove one " .. v, true)
      cecho("<white>"..nWithSpace)
    end
  else
    local x = 0
    for k,v in ipairs(herbs) do
      x = x + 1
      local num = 0
      if wsys.settings["precache"][wsys.profile][v] then
        num = wsys.settings["precache"][wsys.profile][v]
      end
      local d = "<dark_slate_gray>[<white>" .. num .. "<dark_slate_gray>] <white>"
      if (x-1)%3 == 0 then
        echo("\n")
      end
      cecho(d)
      local nWithSpace = v
      local length = nWithSpace:len() + math.floor(math.log10(math.max(1,num)))
      if length < 25 and (x-1)%3~=2 then
        local pad = 25 - length
        nWithSpace = string.rep(" ", pad)
      else
        nWithSpace = ""
      end
      cecho("<white>"..v)
      local aliasone = "wconfig precache " .. v .. " " .. num + 1
      local commandone = [[expandAlias("]]..aliasone..[[")]]
      echo(" ")
      echoLink("(+)", commandone, "Add one more " .. v, true)
      echo(" ")
      local aliastwo = "wconfig precache " .. v .. " " .. num - 1
      local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
      echoLink("(-)", commandtwo, "Remove one " .. v, true)
      cecho("<white>"..nWithSpace)
    end
  end
end
