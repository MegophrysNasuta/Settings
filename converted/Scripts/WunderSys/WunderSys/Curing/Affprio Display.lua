local lprios = {}
local lastcat = lastcat or false

function wsys.affpriodisplay(cat)
 lprios = {
   ["wake"] = {},
   ["stand"] = {},
   ["herb"] = {},
   ["salve"] = {},
   ["smoke"] = {},
   ["health"] = {},
   ["focus"] = {},
   ["writhe"] = {},
   ["compose"] = {},
   ["concentrate"] = {},
   ["immunity"] = {},
  }

  for k,v in pairs(wsys.settings.affprio[wsys.profile][wsys.myClass()]) do
    lprios[wsys.tb.affctype[k]][k] = v
  end
  lastcat = cat or false
  if cat == "all" or cat == nil then
    for k,v in pairs(lprios) do
      wsys.report(string.title(k) .. " priorities:")
      for k,v in wsys.spairs(v, function(t,a,b) return t[b] > t[a] end) do
        cecho("<white>\n"..k .. ": " .. v)
        local aliasone = "wconfig affprio " .. k .. " " .. tonumber(v) + 1
        local commandone = [[expandAlias("]]..aliasone..[[")]]
        echo(" ")
        echoLink("(+)", commandone, "Move 'down' " .. k, true)
        echo(" ")
        local aliastwo = "wconfig affprio " .. k .. " " .. tonumber(v) - 1
        local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
        echoLink("(-)", commandtwo, "Move 'up' " .. k, true)
      end
    end
  elseif table.contains(lprios, cat) then
    wsys.report(string.title(cat) .. " priorities:")
    for k,v in wsys.spairs(lprios[cat], function(t,a,b) return t[b] > t[a] end) do
      cecho("<white>\n"..k .. ": " .. v)
      local aliasone = "wconfig affprio " .. k .. " " .. tonumber(v) + 1
      local commandone = [[expandAlias("]]..aliasone..[[")]]
      echo(" ")
      echoLink("(+)", commandone, "Move 'down' " .. k, true)
      echo(" ")
      local aliastwo = "wconfig affprio " .. k .. " " .. tonumber(v) - 1
      local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
      echoLink("(-)", commandtwo, "Move 'up' " .. k, true)
    end
  else
    wsys.report("Not a valid category. Please pick one of: ........")
  end
end

--don't worry about this one, its just choosing what to echo after a prio setting change
function wsys.postchangeaffpriodisplay(aff)
  if lastcat == "all" then
    wsys.affpriodisplay("all")
  elseif lastcat == wsys.tb.affctype[aff] then
    wsys.affpriodisplay(lastcat)
  else
    wsys.affpriodisplay(wsys.tb.affctype[aff])
  end
end

function wsys.spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end
