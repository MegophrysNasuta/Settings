wsysf.vitals = wsysf.vitals or {}
wsysf.stats = wsysf.stats or {}
wsysf.char_stat_tracking = wsysf.char_stat_tracking or {}

local vitals = {
	"wp", "eq", "ep", "maxhp", "hp", "nl", "maxpep", "maxpwp", "mp", "maxwp", "bal"
}
-- 

function wsysf.char_stat_tracking.vitals()
	wsysf.core.debug.display( 10, gmcp.Char.Vitals, "Vitals" )
	
	-- Vitals (excluding charstats)
	local new_vitals = {}
	wsysf.vitals.prev = nil
	new_vitals.prev = wsysf.vitals
	
	for _,v in ipairs( vitals ) do
		if gmcp.Char.Vitals[v] then
			new_vitals[v] = tonumber( gmcp.Char.Vitals[v] )
		end
	end
	
	wsysf.vitals = new_vitals
	
	-- Charstats parsing 
	local new_stats = {}
	wsysf.stats.prev = nil
	new_stats.prev = wsysf.stats
	
	for _,v in ipairs( gmcp.Char.Vitals.charstats ) do
    local key,value = v:match("(%w+): (.+)")
		if key and value then
			if value:sub(-1) == "%" then value = value:sub(1,-2) end
			if tonumber(value) then value = tonumber(value) end
			new_stats[key:lower()] = value
		end
  end
	
	wsysf.stats = new_stats
	
	wsysf.core.debug.display( 9, wsysf.vitals, "Vitals" )
	wsysf.core.debug.display( 9, wsysf.stats, "Stats" )
	wsysf.core.debug.print(7, "Got Vitals")
	
end

if wsysf.char_stat_tracking.id then killAnonymousEventHandler( wsysf.char_stat_tracking.id ) end
-- EVENT HANDLERS
wsysf.char_stat_tracking.id = registerAnonymousEventHandler("gmcp.Char.Vitals", "wsysf.char_stat_tracking.vitals")
