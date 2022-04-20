-- Table of default prompt tags
wsys.prompttags = wsys.prompttags or {} 

wsys.prompttags["health"] = function() return wsys.stats.h end
wsys.prompttags["percenthealth"] = function() return math.floor(wsys.stats.h / wsys.stats.maxh * 100) end
wsys.prompttags["mana"] = function() return wsys.stats.m end
wsys.prompttags["percentmana"] = function() return math.floor(wsys.stats.m / wsys.stats.maxm * 100) end
wsys.prompttags["endurance"] = function() return wsys.stats.e end
wsys.prompttags["percentendurance"] = function() return math.floor(wsys.stats.e / wsys.stats.maxe * 100) end
wsys.prompttags["willpower"] = function() return wsys.stats.w end
wsys.prompttags["percentwillpower"] = function() return math.floor(wsys.stats.w / wsys.stats.maxw * 100) end
wsys.prompttags["bal"] = function() if wsys.bals.b then return "X" else return "" end end
wsys.prompttags["eq"] = function() if wsys.bals.e then return "E" else return "" end end
wsys.prompttags["lbal"] = function() if wsys.bals.b then return "x" else return "" end end
wsys.prompttags["leq"] = function() if wsys.bals.e then return "e" else return "" end end
wsys.prompttags["target"] = function() if target then return target else return "" end end
wsys.prompttags["paused"] = function() if wsys.paused then return "(PP)" else return "" end end
wsys.prompttags["softpaused"] = function() if wsys.softpaused then return "(sP)" else return "" end end
wsys.prompttags["phase"] = function() if wsys.def.phased or wsys.def.blackwind or wsys.def.astralform then return "@" else return "" end end
wsys.prompttags["retardation"] = function() if wsys.retard then return "[RET]" else return "" end end
wsys.prompttags["kai"] = function() if wsys.def.kaitrance then return wsys.stats.kai .." " else return "" end end
wsys.prompttags["shin"] = function() if wsys.def.shintrance then return wsys.stats.shin.." " else return "" end end
wsys.prompttags["warning"] = function() return wsys.prefixWarning end
wsys.prompttags["mw"] = function() if wsys.def.metawake then return "MW" else return "" end end
wsys.prompttags["breathing"] = function() if wsys.def.breathing then return "br" else return "" end end
wsys.prompttags["xp"] = function() return gmcp.Char.Vitals.nl end
wsys.prompttags["affs"] = function() return wsys.affTags( wsysf.affs, true ) .. wsys.affTags( wsys.predicted, false ) end
wsys.prompttags["timestamp"] = function() return getTimestamp(getLineCount()):gsub("^%s*(.-)%s*$", "%1") end
wsys.prompttags["rage"] = function() if wsys.stats.rage > 0 then return wsys.stats.rage.." " else return "" end end

wsys.prompttags["diffhealth"] = function()
  if wsys.stats.h < wsys.stats.oh then 
    return("<red> (-"..wsys.stats.oh - wsys.stats.h .. "h, " .. string.format("%.1f", ((wsys.stats.oh - wsys.stats.h) / wsys.stats.maxh) * 100) .. "%)")
  elseif wsys.stats.h > wsys.stats.oh then 
    return("<green> (+"..wsys.stats.h - wsys.stats.oh .. "h, " .. string.format("%.1f", ((wsys.stats.h - wsys.stats.oh) / wsys.stats.maxh) * 100) .. "%)") 
  else
    return ""
  end -- if
end

wsys.prompttags["diffmana"] = function()
  if wsys.stats.m < wsys.stats.om then 
    return("<slate_blue> (-"..wsys.stats.om - wsys.stats.m .. "m, " .. string.format("%.1f", ((wsys.stats.om - wsys.stats.m) / wsys.stats.maxm) * 100) .. "%)")
  elseif wsys.stats.m > wsys.stats.om then 
    return("<purple> (+".. wsys.stats.m - wsys.stats.om .. "m, " .. string.format("%.1f", ((wsys.stats.m - wsys.stats.om) / wsys.stats.maxm) * 100) .. "%)") 
  else
    return ""
  end -- if
end

wsys.prompttags["def"] = function() 
  local defstring = ""
  if wsys.def.blindness then
    defstring = defstring .. "<SeaGreen>B "
  end
  if wsys.def.deafness then
    defstring = defstring .. "<SeaGreen>D "
  end
  if wsys.def.cloak then
    defstring = defstring .. "<deep_sky_blue>C "
  end
  if wsys.def.kola then
    defstring = defstring .. "<yellow>K "
  end
  if wsys.def.density then
    defstring = defstring .. "<maroon>M "
  end -- if
  if wsys.def.heldbreath then
    defstring = defstring .. "<light_grey>br"
  end --if
  return defstring
end

wsys.prompttags["invdef"] = function() 
  local invdefstring = ""
  if not wsys.def.blindness then
    invdefstring = invdefstring .. "<SeaGreen>B "
  end
  if not wsys.def.deafness then
    invdefstring = invdefstring .. "<SeaGreen>D "
  end
  if not wsys.def.cloak then
    invdefstring = invdefstring .. "<deep_sky_blue>C "
  end
  if not wsys.def.kola then
    invdefstring = invdefstring .. "<yellow>K "
  end
  if not wsys.def.density then
    invdefstring = invdefstring .. "<maroon>M "
  end -- if
  if wsys.def.heldbreath then
    invdefstring = invdefstring .. "<light_grey>br"
  end --if
  return invdefstring
end

wsys.prompttags["npchp"] = function()
  if gmcp.IRE.Target then         
    if gmcp.IRE.Target.Set == "" or gmcp.IRE.Target.Info.id == "-1" then
      return ""
    elseif gmcp.IRE.Target then
      return tonumber(string.findPattern(gmcp.IRE.Target.Info.hpperc, "%d+"))
    end
  else
    return ""
  end
end

wsys.prompttags.mylimbs = function()
	local str = ""
	
	local limbs = {
	"left leg",
	"right leg",
	"left arm",
	"right arm",
	"torso",
	"head",
}
	local colors = { 
		{ c = "<dark_slate_gray>", val = 0 },
		{ c = "<grey>", val = 1 },
		{ c = "<brown>", val = 4 },
		{ c = "<orange>", val = 7 },
		{ c = "<red>", val = 10 },
		}

	local first = true
	for _,limb in pairs(limbs) do
		if not first then
			str = str.."<dark_slate_gray>|"
		end
		local d = tonumber(wsys.tb.selflimbdamage[limb].damage)
		local color = colors[0] 
		d = math.floor(d+0.5)
		for _,t in ipairs( colors ) do
			if d >= t.val then
				color = t.c
			else
				break
			end
		end

		str = str.. color..d
		first = false
	end
	return str
end

--table of default prompt tag colors
wsys.prompttagcolors = wsys.prompttagcolors or {} 
  
wsys.prompttagcolors["hcolour"] = function()
  if wsys.stats.h >= (wsys.stats.maxh * 0.75) then
    return "sea_green"
  elseif wsys.stats.h >= (wsys.stats.maxh * 0.33) then
    return "gold"
  else
    return "red"
  end --if
end

wsys.prompttagcolors["mcolour"] = function()
  if wsys.stats.m >= (wsys.stats.maxm * .75) then
    return "sea_green"
  elseif wsys.stats.m >= (wsys.stats.maxm * .50) then
    return "gold"
  else
    return "red"
  end -- if
end

wsys.prompttagcolors["wcolour"] = function()
  if wsys.stats.w >= (wsys.stats.maxw * .66) then
    return "sea_green"
  elseif wsys.stats.w >= (wsys.stats.maxw * .50) then
    return "gold"
  else
    return "red"
  end -- if
end

wsys.prompttagcolors["ecolour"] = function()
  if wsys.stats.e >= (wsys.stats.maxe * .66) then
    return "sea_green"
  elseif wsys.stats.e >= (wsys.stats.maxe * .50) then
    return "gold"
  else
    return "red"
  end -- if
end

wsys.prompttagcolors["kaicolour"] = function()
  if wsys.stats.kai < 10 then
    --can't even choke
    return "red"
  elseif wsys.stats.kai < 21 then
    --can't heal
    return "firebrick"
  elseif wsys.stats.kai < 41 then
    --can't cripple
    return "dark_orange"
  elseif wsys.stats.kai < 61 then
    --can't enfeeble
    return "yellow"
  elseif wsys.stats.kai >= 61 then
    --can do anything
    return "green"
  end
end
                  
wsys.prompttagcolors["shincolour"] = function()
  if wsys.stats.shin < 4 then
    --can't even infuse
    return "red"
  elseif wsys.stats.shin < 14 then
    --can't fist
    return "firebrick"
  elseif wsys.stats.shin < 29 then
    --can't blizzard
    return "dark_orange"
  elseif wsys.stats.shin < 39 then
    --can't annihilate
    return "yellow"
  else
    --can do anything
    return "green"
  end
end
