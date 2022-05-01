cdb = cdb or {}
cdb.db = cdb.db or {}
cdb.honors = {}
cdb.lights = cdb.lights or {}
cdb.enemies = cdb.enemies or {}

-- 
--  CDB - A lightweight, easy to use character database. By Romaen.
-- 
--  If you encounter problems, send me an OOC message in game or ping me on discord, theo#7545
--

function cdb.echo(str)
  cecho("<DimGrey>(<grey>cdb<DimGrey>): <white>" .. str .. "\n")
end

function cdb.warn(str)
  cecho("<chocolate>(cdb <orange>warning<chocolate>): <white>" .. str .. "\n")
end

function cdb.error(str)
  cecho("<firebrick>(cdb <red>error<firebrick>): <white>" .. str .. "\n")
end

function cdb.lookup(name)
  name = name:lower():title()
  downloadFile(getMudletHomeDir() .. "/temp.json", "https:\/\/api.achaea.com\/characters\/" .. name:lower() .. ".json")
end

function cdb.onConnect()
  cdb.echo("Initialised.")
  cdb.highlights()
end

registerAnonymousEventHandler("sysConnectionEvent", "cdb.onConnect")

function cdb.getwho()
  downloadFile(getMudletHomeDir() .. "/who.json", "http:\/\/api.achaea.com\/characters.json")
end

function cdb.gotinfo(ev, ar)
  if ev ~= "sysDownloadDone" then return end
  if ar:match("temp%.json") then
    local f, s = io.open(getMudletHomeDir() .. "/temp.json")
    if f then 
      s = f:read("*l"):trim()
      io.close(f)
    else
      cdb.error("Retrieving data failed.")
    end
    local t = yajl.to_value(s)
    if cdb.db[t.name] and cdb.db[t.name] ~= "(hidden)" and t.city == "(hidden)" then
      t.city = cdb.db[t.name].city
    end
    cdb.db[t.name] = t
    if cdb.last and t.name == cdb.last then
      cdb.echo("<green>Finished <white>getting information for all online players.")
      cdb.last = nil
      cdb.save()
      cdb.anons()
    elseif cdb.classing then
      cdb.echo(t.name .. "'s current class is <cyan>" .. t.class .. ".")
      cdb.classing = nil
      cdb.save()
    elseif cdb.looking then
      cdb.echo("Data retrieved.")
      cdb.save()
      cdb.looking = nil
    elseif not cdb.last then
      cdb.save()
    end
    cdb.addhighlight(t.name)
  elseif ar:match("who%.json") then
    local f, s = io.open(getMudletHomeDir() .. "/who.json")
    if f then 
      s = f:read("*l"):trim()
      io.close(f)
    end
    local t = yajl.to_value(s)
    for _, v in pairs(t.characters) do
      if cdb.gettingmembers then
        if cdb.db[v.name] and cdb.db[v.name].class == cdb.gettingmembers then
          cdb.members[#cdb.members+1] = v.name
        end
      else
        cdb.lookup(v.name)
        cdb.last = v.name
      end
    end
    if cdb.gettingmembers then
      local t = ""
      if #cdb.members == 0 then t = "<DarkSlateGrey>(none)" else t = table.concat(cdb.members, ", ") end
      cdb.echo("Online members of <yellow>"..cdb.gettingmembers.."<white> class:\n  <cyan>" .. t .. ".")
      cdb.gettingmembers = nil
      cdb.members = {}
    end
  end
end
registerAnonymousEventHandler("sysDownloadDone", "cdb.gotinfo")

function cdb.getmembers(class)
  cdb.gettingmembers = class
  cdb.members = {}
  cdb.getwho()
end


function cdb.display(name, prompt)
  name = name:lower():title()
  if cdb.db[name] then
    local t = cdb.db[name]
    local x = #t.fullname
    local f = ""
    if x < 50 then x, f = 50, string.rep(" ", 50 - x) end
    cecho("<smoke>╭" .. string.rep("─", x + 16) .. "╮\n")
    cecho("<smoke>│  ╔═════╗    " .. string.rep(" ", x) .. "   │\n")
    cecho("<smoke>│  ║ <obs>CDB <smoke>║  <yellow>\"" .. t.fullname .. ".\"  " .. f .. "<smoke>│\n")
    cecho("<smoke>│  ╚══╦══╝    " .. string.rep(" ", x) .. "   │\n")
    cecho("<smoke>╞═════╩═══════" .. string.rep("═", x) .. "═══╡\n")
    if cdb.db[name].level == "" then
      cecho("<smoke>│" .. string.rep(" ", x + 16) .. "│\n")
      cecho("<smoke>│            <cyan>Divine." .. string.rep(" ", x-3) .. "<smoke>│\n")
      cecho("<smoke>│" .. string.rep(" ", x + 16) .. "│\n")
      cecho("<smoke>╰" .. string.rep("─", x + 16) .. "╯\n")
    else
      cecho("<smoke>│          <obs>city: <white>" .. t.city:title() .. string.rep(" ", x - #t.city) .. "<smoke>│\n")
      cecho("<smoke>│         <obs>house: <white>" .. t.house:title() .. string.rep(" ", x - #t.house) .. "<smoke>│\n")
      cecho("<smoke>│         <obs>class: <white>" .. t.class:title() .. string.rep(" ", x - #t.class) .. "<smoke>│\n")
      cecho("<smoke>│         <obs>level: <white>" .. t.level .. string.rep(" ", x - #t.level) .. "<smoke>│\n")
      cecho("<smoke>│           <obs>pks: <white>" .. t.player_kills .. string.rep(" ", x - #t.player_kills) .. "<smoke>│\n")
      cecho("<smoke>│          <obs>mobs: <white>" .. t.mob_kills .. string.rep(" ", x - #t.mob_kills) .. "<smoke>│\n")
      cecho("<smoke>╰" .. string.rep("─", x + 16) .. "╯\n")
    end
    cdb.save()
  else
    cdb.warn("Please get that character's information first. <obs>(cdb " .. name .. ")")
  end
end

function cdb.anons()
  cdb.echo("Players who you'll need to manually honours:")
  local g = true
  for k, v in pairs(cdb.db) do
    if v.city == "(hidden)" then
      cecho("  + <yellow>" .. v.name .. "\n")
      g = false
    end
  end
  if g then cecho("  <obs>(none)\n") end
end

function cdb.classcheck(name)
  name = name:lower():title()
  cdb.classing = name 
  cdb.lookup(name)
end

function cdb.honorsupdate()
  if not (cdb.honors.title and cdb.honors.city) then return end
  for k, v in pairs(cdb.db) do
    if v.fullname == cdb.honors.title then
      cdb.db[v.name].city = cdb.honors.city
      cdb.addhighlight(v.name)
    end
  end
  cdb.honors = {}
end

function cdb.hl(name)
  local city = cdb.db[name].city
  if not city then return end
  if city == "" then city = "divine" end
  local line = getCurrentLine()
  local i = 1
  while i > 0 do
    local p = selectString(name, i)
    if p > -1 then
      local x = line:sub(p + #name + 1, p + #name + 1) or "!"
      if x == "" or x:match("%A") then
        if cdb.enemies[name] and cdb.styles.enemies.color ~= "" then
          fg(cdb.styles.enemies.color)
        elseif cdb.styles[city] and cdb.styles[city].color ~= "" then 
          fg(cdb.styles[city].color)
        end
        if cdb.styles[city].underline or (cdb.enemies[name] and cdb.styles.enemies.underline) then setUnderline(true) end
        if cdb.styles[city].italics or (cdb.enemies[name] and cdb.styles.enemies.italics) then setItalics(true) end
        if cdb.styles[city].bold or (cdb.enemies[name] and cdb.styles.enemies.bold) then setBold(true) end
        resetFormat()
      end
      deselect()
      i = i + 1
    else
      deselect()
      i = 0
    end
  end
end

function cdb.highlights()
  for k, v in pairs(cdb.db) do
    if not cdb.lights[v.name] then
      cdb.lights[v.name] = tempTrigger(v.name, [[cdb.hl("]] .. v.name .. [[")]])
    end
  end
end

function cdb.addhighlight(name)
  name = name:lower():title()
  if not cdb.lights[name] then
    cdb.lights[name] = tempTrigger(name, [[cdb.hl("]] .. name .. [[")]])
  end
end

function cdb.save()
  local sep = (getMudletHomeDir():sub(3, 3) == "/" and "/") or "\\"
  table.save(getMudletHomeDir() .. sep .. "cdb.lua", cdb.db)
  table.save(getMudletHomeDir() .. sep .. "enemies.lua", cdb.enemies)
end

function cdb.load()
  local sep = (getMudletHomeDir():sub(3, 3) == "/" and "/") or "\\"
  if io.exists(getMudletHomeDir() .. sep .. "cdb.lua") then
    table.load(getMudletHomeDir() .. sep .. "cdb.lua", cdb.db)
  else
    table.save(getMudletHomeDir() .. sep .. "cdb.lua", cdb.db)
  end
  
  if io.exists(getMudletHomeDir() .. sep .. "enemies.lua") then
    table.load(getMudletHomeDir() .. sep .. "enemies.lua", cdb.enemies)
  else
    table.save(getMudletHomeDir() .. sep .. "enemies.lua", cdb.enemies)
  end
end

cdb.load()
