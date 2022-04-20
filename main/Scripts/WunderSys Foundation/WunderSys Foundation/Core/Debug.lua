wsysf.core.debug = wsysf.core.debug or {}
wsysf.core.debug.level = 2	 -- 1 = ERROR, 2 = WARN, 3 = INFO, 4 = DEBUG, 5-10 = Verbose
-- TODO lower debug level before release. Probably to 1 or 2 by default

local levels = {
	[1] = { color = "red", name = "ERROR" },
	[2] = { color = "OrangeRed", name = "WARNING" },
	[3] = { color = "gold", name = "INFO" },
	[4] = { color = "PaleGoldenrod", name = "DEBUG" },
	default = { color = "light_grey", name = "VERBOSE" },
}

function wsysf.core.debug.print( level, str )
	if wsysf.core.debug.level >= level then
		local border = "lime_green"
		local level_t = levels[level] or levels.default
		local color = level_t.color
		
		cecho( string.format("\n<%s>[<%s>%s<%s>](<%s>%d<%s>): <%s>%s", 
					border, color, level_t.name, border, color, level, border, color, str ) )
	end
end

function wsysf.core.debug.display( level, t, str )
	if wsysf.core.debug.level >= level then
		wsysf.core.debug.print( level, ( str or "" ) .. "\n" )
		display( t )
	end
end
