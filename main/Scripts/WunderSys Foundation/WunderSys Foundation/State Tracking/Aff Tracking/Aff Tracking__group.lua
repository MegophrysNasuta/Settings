wsysf.aff_tracking = wsysf.aff_tracking or { ids = {} }
wsysf.aff_tracking.diagnose_lines = wsysf.aff_tracking.diagnose_lines or {}

wsysf.affs = wsysf.affs or {}

wsysf.aff_tracking.new = {} -- These are the affs that were added since the previous prompt
wsysf.aff_tracking.lost = {} -- These are the affs that were removed since the previous prompt
wsysf.aff_tracking.trigger_ids = {}

local stackables = {
	-- Alchemist Tempers cap at 8
	temperedcholeric = { max = 8 },
	temperedmelancholic = { max = 8 },
	temperedphlegmatic = { max = 8 }, 
	temperedsanguine = { max = 8 },
	
	-- Unweave stackables cap at 5
	unweavingbody = { max = 5 },
	unweavingmind = { max = 5 },
	unweavingspirit = { max = 5 },
	
	-- 2h fractures are uncapped, but cure double if at or above 6
	torntendons = { doublecure_at = 6, max = 7 },
	wristfractures = { doublecure_at = 6, max = 7 },
	skullfractures = { doublecure_at = 6, max = 7 },
	crackedribs = { doublecure_at = 6, max = 7 },
}

--setmetatable(wsysf.affs, aff_mt)

--- wsysf.affv = "aff value". If the aff is valid, then returns it as a number
-- if the specified aff is not valid, then returns 0, rather than false
-- This means: if wsysf.affv.whatever then ... will always pass
-- But it also allows kelp = wsysf.affv.asthma + wsysf.affv.weariness + ... etc
-- to be valid, without needing to convert them all to numbers
wsysf.affv = setmetatable({}, {
	__index = function(t,k)
		local value = wsysf.affs[k]

		if not value then 
			return 0
		elseif value == true then 
			return 1 
		else 
			return tonumber(value) or value 
		end
	end,
})

-- Translate "wristfractures (1)" to wristfractures,1
local function get_affs_value( name )
	aff,value = name:match("(%w+) %((.+)%)")
	if aff then
		return aff,tonumber(value) or value,true
	end
	
	return name,1,false
end

--- Track affs that have been gained or lost until the next prompt
function wsysf.aff_tracking.on_prompt()
	wsysf.aff_tracking.on_prompt_id = nil
	wsysf.core.debug.display( 9, wsysf.aff_tracking.new, "Affs gained on prompt" )
	wsysf.core.debug.display( 9, wsysf.aff_tracking.lost, "Affs lost on prompt" )
	wsysf.aff_tracking.new = {}
	wsysf.aff_tracking.lost = {}
	
	for _,id in ipairs(wsysf.aff_tracking.trigger_ids) do
		killTrigger( id )
	end
	wsysf.aff_tracking.trigger_ids = {}
end

function wsysf.aff_tracking.set_aff_value( aff, value )
	if value == true then value = 1 end -- Convert "true" to 1
	
	if wsysf.affs[aff] ~= value then
		wsysf.aff_tracking.new[aff] = value
		if not wsysf.aff_tracking.on_prompt_id then wsysf.aff_tracking.on_prompt_id = tempPromptTrigger( wsysf.aff_tracking.on_prompt, 1 ) end
		
		wsysf.affs[aff] = value
		
		wsysf.core.debug.print( 5, "Aff: "..aff.."="..tostring(value) )
		
    raiseEvent("wsysf got aff", aff)
	end
end

function wsysf.aff_tracking.add()
  local aff,value = get_affs_value( gmcp.Char.Afflictions.Add.name )
	
	wsysf.core.debug.display( 7, gmcp.Char.Afflictions.Add, "Aff Added" )
	
	-- Track affs that have been added, and clear them on the next prompt
	-- This will let us perform special handling on triggers if needed
	wsysf.aff_tracking.new[aff] = value
	if not wsysf.aff_tracking.on_prompt_id then wsysf.aff_tracking.on_prompt_id = tempPromptTrigger( wsysf.aff_tracking.on_prompt, 1 ) end
	
  wsysf.aff_tracking.set_aff_value( aff, value )
end
	
function wsysf.aff_tracking.remove()
	wsysf.core.debug.display( 7, gmcp.Char.Afflictions.Remove, "affs Removed" )

  for _, v in ipairs(gmcp.Char.Afflictions.Remove) do
		local aff,value = get_affs_value( v )
		
		-- Track affs that have been lost, and clear them on the next prompt
		wsysf.aff_tracking.lost[ aff ] = wsysf.affs[aff] or value
		if not wsysf.aff_tracking.on_prompt_id then wsysf.aff_tracking.on_prompt_id = tempPromptTrigger( wsysf.aff_tracking.on_prompt, 1 ) end
		
		if type(value) == "number" and value > 1 then
			-- When stackable affs are reduced, you get removed "aff (#)" where # is the previous number of stacks. 
			-- Assume we removed one stack, except for special cases
			if stackables[aff] and stackables[aff].doublecure_at and value >= stackables[aff].doublecure_at then
				value = value - 1
			end
			value = value - 1
			
		else
			value = nil
		end
		
  	wsysf.affs[aff] = value or nil
		wsysf.core.debug.print( 5, "Aff: "..aff.."="..tostring(wsysf.affs[aff]) )
  	raiseEvent("wsysf lost aff", aff)
  end
end
	
function wsysf.aff_tracking.list()
  local newaffs = {}
  local addedaffs, lostaffs = {}, {}
	
	wsysf.core.debug.display( 7, gmcp.Char.Afflictions.List, "Aff List" )
	
  for _, v in ipairs(gmcp.Char.Afflictions.List) do
		local aff,value,has_value = get_affs_value( v.name )
		
		-- For stackable affs, the list just gives "aff", no (#). Should keep the old number if we have it
    newaffs[aff] = value
    if wsysf.affs[aff] ~= value then
      
			if type(wsysf.affs[aff]) == "number" and wsysf.affs[aff] > 0 and not has_value then
				newaffs[aff] = wsysf.affs[aff]
			else
				addedaffs[#addedaffs + 1] = aff
			end
    end
		
		-- Check for custom diagnose lines if we don't get stack info from gmcp
		if wsysf.aff_tracking.diagnose_lines[aff] then
			local trigger_id = tempRegexTrigger( wsysf.aff_tracking.diagnose_lines[aff].regex_line, wsysf.aff_tracking.diagnose_lines[aff].func, 1 )
			
			echo("Added trigger for "..aff.." "..trigger_id )
			
			table.insert(wsysf.aff_tracking.trigger_ids, trigger_id) 
		end
  end
  for aff in pairs(wsysf.affs) do
    if not newaffs[aff] then
      lostaffs[#lostaffs + 1] = aff
    end
  end
  wsysf.affs = newaffs
  for _, aff in pairs(lostaffs) do
    raiseEvent("wsysf lost aff", aff)
  end
  for _, aff in ipairs(addedaffs) do
    raiseEvent("wsysf got aff", aff)
  end
end
	
for _,id in pairs(wsysf.aff_tracking.ids) do
	killAnonymousEventHandler( id )
end

-- EVENT HANDLERS
wsysf.aff_tracking.ids.add =
	registerAnonymousEventHandler("gmcp.Char.Afflictions.Add", "wsysf.aff_tracking.add")
wsysf.aff_tracking.ids.remove =
	registerAnonymousEventHandler("gmcp.Char.Afflictions.Remove", "wsysf.aff_tracking.remove")
wsysf.aff_tracking.ids.list =
	registerAnonymousEventHandler("gmcp.Char.Afflictions.List", "wsysf.aff_tracking.list")
	
	
-- If value is a number, it stays a number. If value is true, return 1. Otherwise 0
local get_aff_count = function( value )
	if not value then
		return 0
	else
		return value and tonumber(value) or 1
	end
end
	
function wsysf.aff_tracking.stack_up( aff, count )
	if wsysf.affs[aff] then
	-- Assume we only get these messages if we already know about them
		
		count = count or 1
		-- If we just gained this, the count may not match what we expect.
		-- E.g. gaining tenonds gives torntendons (1), even if focused precision
		count = count - get_aff_count( wsysf.aff_tracking.new[aff] )
		
		if count > 0 then
			local new_count = wsysf.affs[aff] + count
			
			-- Some stackable affs have a hard upper limit.
			if stackables[aff] and stackables[aff].max and new_count > stackables[aff].max then
				new_count = stackables[aff].max
			end	
			
			wsysf.affs[aff] = new_count
			-- Add count to the aff count, with an optional max limit
  		wsysf.core.debug.print(5, aff.."="..wsysf.affs[aff] )
  		
  		raiseEvent( "wsysf got aff", aff )
		end
	end
end

function wsysf.aff_tracking.stack_down( aff, count )
	if wsysf.affs[aff] then
	-- Assume we only get these messages if we already know about them
		
		count = count or 1

		-- We shouldn't be using stack down with gmcp, should we?
		if wsysf.aff_tracking.lost[aff] then
			cecho("<red>Wsysf: stack_down( "..aff.." ) but gmcp lost it?")
			wsysf.core.debug.print(1, "stack_down( "..aff.." ) but gmcp lost it?")
		elseif wsysf.affv[aff] > 1 then
			wsysf.affs[aff] = wsysf.affv[aff] - count
			
			wsysf.core.debug.print(5, aff.."="..wsysf.affs[aff] )
			raiseEvent( "wsysf lost aff", aff )
		else
			wsysf.core.debug.print(2, "stack_down( "..aff.." ) at 1 stack?: "..tostring(wsysf.affs[aff]))
		end
	end
end

