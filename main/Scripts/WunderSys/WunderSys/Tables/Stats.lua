-- STATS TABLE
wsys.stats = {

 h = 5000,
 m = 5000,
 e = 20000,
 w = 20000,
 maxh = 5000,
 maxm = 5000,
 maxw = 20000,
 maxe = 20000,
 oh = 5000, --old health
 om = 5000, --old mana
 xp = 0,
 oxp = 0, --old xp
 kai = 0,
 shin = 0,
 rage = 0,
}

local charstats = {
  ["Bleed"] = function( val ) wsys.bleeding = tonumber( val ) end,
  ["Rage"] = function( val ) wsys.stats.rage = tonumber( val ) end,
}

function wsys.statupdate()
 
  wsys.stats.oh = wsys.stats.h or 5000
  wsys.stats.om = wsys.stats.m or 5000
  wsys.stats.oxp = wsys.stats.xp or 0

  wsys.stats.h = tonumber(gmcp.Char.Vitals.hp)
  wsys.stats.m = tonumber(gmcp.Char.Vitals.mp)
  wsys.stats.e = tonumber(gmcp.Char.Vitals.ep)
  wsys.stats.w = tonumber(gmcp.Char.Vitals.wp)

  wsys.stats.maxh = tonumber(gmcp.Char.Vitals.maxhp)
  wsys.stats.maxm = tonumber(gmcp.Char.Vitals.maxmp)
  wsys.stats.maxe = tonumber(gmcp.Char.Vitals.maxep)
  wsys.stats.maxw = tonumber(gmcp.Char.Vitals.maxwp)

  for _,str in ipairs( gmcp.Char.Vitals.charstats ) do
    local sep = str:find( ": " )
    if sep then
      local key = str:sub( 1, sep - 1 )
      local val = str:sub( sep + 2 )
      if charstats[key] then charstats[key]( val ) end
    end
  end

  if wsys.stats.oh ~= wsys.stats.h then
    raiseEvent("health changed")
  end
  if wsys.stats.om ~= wsys.stats.m then
    raiseEvent("mana changed")
  end
end -- func

registerAnonymousEventHandler("gmcp.Char.Vitals", "wsys.statupdate")

