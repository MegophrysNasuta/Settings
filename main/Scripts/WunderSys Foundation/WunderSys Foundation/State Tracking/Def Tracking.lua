wsysf.def_tracking = wsysf.def_tracking or { ids = {} }

wsysf.defs = wsysf.defs or {}

-- Translate "parrying (head)" to parrying,head
local function get_defs_value( name )

	def,value = name:match("(%w+) %((.+)%)")
	if def then
		return def,value
	end
	
	return name,true
end

function wsysf_test()
	def,value = get_defs_value( "parrying (right leg)" )
	
	echo("\ndef="..def.."\nvalue="..tostring(value))
	
	def,value = get_defs_value( "tekurastance" )
	
	echo("\ndef="..def.."\nvalue="..tostring(value))
end

-- Largely taken from MMP Defense tracking
function wsysf.def_tracking.add()
  local def,value = get_defs_value( gmcp.Char.Defences.Add.name )
	
	wsysf.core.debug.display( 10, gmcp.Char.Defences.Add, "Def Added" )
	
  if wsysf.defs[def] ~= value then
    wsysf.defs[def] = value
		wsysf.core.debug.print( 5, "Def: "..def.."="..tostring(value) )
		
    raiseEvent("wsysf got def", def)
  end
end
	
function wsysf.def_tracking.remove()
	wsysf.core.debug.display( 10, gmcp.Char.Defences.Remove, "Defs Removed" )

  for _, def in ipairs(gmcp.Char.Defences.Remove) do
    wsysf.defs[def] = nil
    raiseEvent("wsysf lost def", def)
  end
end
	
function wsysf.def_tracking.list()
  local newDefs = {}
  local addedDefs, lostDefs = {}, {}
	
	wsysf.core.debug.display( 10, gmcp.Char.Defences.List, "Def List" )
	
  for _, v in ipairs(gmcp.Char.Defences.List) do
		local def,value = get_defs_value( v.name )
    newDefs[def] = value
    if wsysf.defs[def] ~= value then
      addedDefs[#addedDefs + 1] = def
    end
  end
  for def in pairs(wsysf.defs) do
    if not newDefs[def] then
      lostDefs[#lostDefs + 1] = def
    end
  end
  wsysf.defs = newDefs
  for _, def in pairs(lostDefs) do
    raiseEvent("wsysf lost def", def)
  end
  for _, def in ipairs(addedDefs) do
    raiseEvent("wsysf got def", def)
  end
end
	
for _,id in pairs(wsysf.def_tracking.ids) do
	killAnonymousEventHandler( id )
end

-- EVENT HANDLERS
wsysf.def_tracking.ids.add =
	registerAnonymousEventHandler("gmcp.Char.Defences.Add", "wsysf.def_tracking.add")
wsysf.def_tracking.ids.remove =
	registerAnonymousEventHandler("gmcp.Char.Defences.Remove", "wsysf.def_tracking.remove")
wsysf.def_tracking.ids.list =
	registerAnonymousEventHandler("gmcp.Char.Defences.List", "wsysf.def_tracking.list")

