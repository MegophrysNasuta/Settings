wsys.overrides.afftags = wsys.overrides.afftags or {}
-- Shortnames = { aff = "name" }
wsys.overrides.afftags.shortnames = wsys.overrides.afftags.shortnames or {}
-- colors = { aff = "color", aff2 = { "color1", [4] = "color at 4+ stacks" } }
wsys.overrides.afftags.colors = wsys.overrides.afftags.colors or {}
-- cure_colors = { cure = "color", cure2 = { "color1", [6] = "color at 6+ stacks" } }
wsys.overrides.afftags.cure_colors = wsys.overrides.afftags.cure_colors or {}


-- Probably use an override table
local aff_short = {
 deafness = "",
 blindness = "",
 insomnia = "",
 addiction = "add",
 aeon = "ae",
 agoraphobia = "agor",
 anorexia = "ano",
 asphyxiating = "", -- Lets Air Lord see what smoke cure you used
 sleeping = "slp",
 asthma = "ast",
 concussion = "concuss",
 damagedhead = "h1",
 blackout = "",
 bleeding = "bld",
 demonstain = "stain",
 damagedleftarm = "la2",
 damagedleftleg = "ll2",
 bleg = "uleg1",
 damagedrightarm = "ra2",
 damagedrightleg = "rl2",
 mildtrauma = "t1",
 carm = "uwna",
 claustrophobia = "clau",
 brokenleftarm = "la1",
 brokenleftleg = "ll1",
 cleg = "uwnl",
 climb = "uwcrip",
 clumsiness = "Cl",
 confusion = "con",
 brokenrightarm = "ra1",
 brokenrightleg = "rl1",
 darkshade = "dark",
 deadening = "dea",
 dementia = "dem",
 depression = "dep",
 disloyalty = "disl",
 disrupted = "dis",
 dissonance = "diss",
 dizziness = "diz",
 epilepsy = "epi",
 fear = "fear",
 frozen = "frozen",
 generosity = "gen",
 haemophilia = "haem",
 hallucinations = "hallu",
 healthleech = "hleech",
 hellsight = "hell",
 hypersomnia = "hypers",
 hypochondria = "hypo",
 impaled = "Impale",
 impatience = "IMP",
 internalbleeding = "ImpaleSlash",
 inquisition = "",
 cadmuscurse = "cadmus",
 weakenedmind = "rixil",
 hecatecurse = "HECATE",
 itching = "",
 lethargy = "let",
 loneliness = "lon",
 lovers = "lust",
 justice = "just",
 whisperingmadness = "MAD",
 masochism = "maso",
 manaleech = "mleech",
 mangledhead = "h2",
 mangledleftarm = "la3",
 mangledleftleg = "ll3",
 mangledrightarm = "ra3",
 mangledrightleg = "rl3",
 serioustrauma = "t2",
 nausea = "nau",
 pacified = "pac",
 paralysis = "PAR",
 paranoia = "para",
 parasite = "paras",
 peace = "pea",
 prone = "PR",
 recklessness = "reck",
 retribution = "ret",
 scytherus = "SCY",
 sensitivity = "sen",
 daeggerimpale = "Impale",
 shadowmadness = "sham",
 shivering = "shiv",
 shyness = "shy",
 slickness = "SLI",
 speared = "Impale",
 stupidity = "st",
 stuttering = "stut",
 entangled = "tangled",
 bound = "bound",
 transfixation = "transf",
 weariness = "Wea",
 webbed = "web",
 vertigo = "vert",
 voyria = "voy",
 heartseed = "hseed",
 temperedsanguine = "sang",
 temperedcholeric = "chol",
 temperedphlegmatic = "phleg",
 temperedmelancholic = "melan",
 torntendons = "tendons",
 wristfractures = "wrist",
 crackedribs = "ribs",
 skullfractures = "skull",
 burning = "burn",
 unweavingmind = "UNM",
 unweavingbody = "UNB",
 unweavingspirit = "UNS",
 mindravaged = "MIND RAVAGE",
 pressure = "PRESS",
 tension = "tens",
}

local aff_colors = {
	bleeding = { "maroon", [500] = "red" },
	burning = { "SlateGrey", "brown", "red" },
	pressure = { "SlateGrey", "DeepSkyBlue", [4] = "cyan", [6] = "white" },
	prone = "orchid",
	mindravaged = "red:gray",
}

-- The cure may be the prefix to an actual cure
-- E.g. "mending" matches "mendingarms" or "mendinglegs" but not "foomending"
local cure_colors = {
	kelp = "chartreuse",
	goldenseal = "yellow",
	ginseng = "dark_goldenrod",
	lobelia = "moccasin",
	elm = "sky_blue",
	valerian = "royal_blue",
	restoration = "brown",
	mending = "brown",
	health = { "medium_violet_red", [6] = "deep_pink" }, -- fractures
	ginger = { "medium_purple", [6] = "purple" },
}

-- Return the color to use for an value, given a color_option
-- Color_option is either a string "color", or a table with a list of colors to
-- use based on the aff_value
local getColor = function( color_option, value )
  local color = false
	
	if type(color_option) == "string" then
		-- Aff color is a string, so use it
		color = color_option
		
	elseif type(color_option) == "table" then
		-- Pick a color based on value
		local max = 0
		local current_val = tonumber(value) or ( value and 1 ) or 0
		
		for i,v in pairs(color_option) do
			if i > max and current_val >= i then
				max = i
				color = v
			end
		end
	end
	return color
end

local getAffLabel = function( aff, value )
  local short = wsys.overrides.afftags.shortnames[aff] or aff_short[aff]
	
	if short and #short == 0 then
		-- Short is "", don't display anythign
		return false
	end
	
	local color = getColor( wsys.overrides.afftags.colors[aff] or aff_colors[aff], value )
	
	if not color and wsys.tb.affc[aff] then
		-- Pick a color based on cure-type
		for _,aff_cure in ipairs(wsys.tb.affc[aff]) do
			-- Check the overrides first
			for cure,ccolor in pairs(wsys.overrides.afftags.cure_colors) do
				if string.match( aff_cure, "^"..cure ) then
					color = getColor( ccolor, value )
					break
				end
			end
			if color then break end -- Break out of the affc table loop if we found a match
		
			-- Check the default colors
			for cure,ccolor in pairs(cure_colors) do
				if string.match( aff_cure, "^"..cure ) then
					color = getColor( ccolor, value )
					break
				end
			end
			if color then break end -- Break out of the affc table loop if we found a match
		end
	end
	
	if not color then
		if short then
			-- No special color
			color = "SlateGrey"
		else
			-- No short means we don't know about it. Use a default color
			color = "IndianRed"
		end
	end
	
	short = short or aff
	
	if tonumber(value) and value > 1 then
		-- Stackable aff, append (#)
		short = short .."("..value..")"
	end
	
  return "<"..color..">"..short
end

function wsys.affTags( affs, include_bleed )
  local s = {}
  if include_bleed and wsysf.stats.bleed and wsysf.stats.bleed > 50 then
  	s[#s+1] = getAffLabel( "bleeding", wsysf.stats.bleed )
  end
  for aff,value in pairs(affs) do
		entry = getAffLabel(aff, value)
		if entry then
			s[#s+1] = entry
		end
	end
  return #s > 0 and ("<IndianRed>["..table.concat(s, " ").."<IndianRed>]") or ""
end
