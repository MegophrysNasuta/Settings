function wsys.newProfile( name )
 if not table.contains(wsys.settings.profilenames, name) then
  -- add name to available profiles
  wsys.settings.profilenames[#wsys.settings.profilenames+1] = name
  -- create new profile
  wsys.settings.affprio[name] = {}
  wsys.settings.affprio[name][wsys.myClass()] = wsys.return_defaultaffprios()
  wsys.settings.defup[name] = {}
  wsys.settings.defup[name][wsys.myClass()] = {}
  wsys.settings.defprio[name] = {}
  wsys.settings.defprio[name][wsys.myClass()] = {}
  wsys.settings.keepup[name] = {}
  wsys.settings.keepup[name][wsys.myClass()] = {}
  wsys.settings.precache[name] = {}
  wsys.settings.focusshifts[name] = {}
  wsys.settings.focusshifts[name][wsys.myClass()] = {}
  
  wsys.report("Created new profile named: " .. name)
 end
end

function wsys.copyProfile( pOrig, pCopy )
  if table.contains(wsys.settings.profilenames, pOrig) and table.contains(wsys.settings.profilenames, pCopy) then
    wsys.settings.affprio[pCopy] = wsys.deepcopy(wsys.settings.affprio[pOrig])
    wsys.settings.defup[pCopy] = wsys.deepcopy(wsys.settings.defup[pOrig])
    wsys.settings.defprio[pCopy] = wsys.deepcopy(wsys.settings.defprio[pOrig])
    wsys.settings.keepup[pCopy] = wsys.deepcopy(wsys.settings.keepup[pOrig])
    wsys.settings.precache[pCopy] = wsys.deepcopy(wsys.settings.precache[pOrig])
    wsys.settings.focusshifts[pCopy] = wsys.deepcopy(wsys.settings.focusshifts[pOrig])
    wsys.report("Copied " .. pOrig .. " settings into the " .. pCopy .. " profile.")
  elseif not table.contains(wsys.settings.profilenames, pOrig) then
    wsys.report(pOrig .. " profile does not exist, please create it first.")
  elseif not table.contains(wsys.settings.profilenames, pCopy) then
    wsys.report(pCopy .. " profile does not exist, please create it first.")
  end
end

function wsys.copyProfileClass( copied_class )
  if wsys.settings.affprio[wsys.profile][copied_class] == nil then
    wsys.report(copied_class .. " class profile does not exist, please create it first.")
  else
    if wsys.settings.affprio[wsys.profile][wsys.myClass()] == nil then
      wsys.newclasstables(wsys.myClass())
    end
    wsys.settings.affprio[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.affprio[wsys.profile][copied_class])
    wsys.settings.defup[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.defup[wsys.profile][copied_class])
    wsys.settings.defprio[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.defprio[wsys.profile][copied_class])
    wsys.settings.keepup[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.keepup[wsys.profile][copied_class])
    wsys.settings.precache[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.precache[wsys.profile][copied_class])
    wsys.settings.focusshifts[wsys.profile][wsys.myClass()] = wsys.deepcopy(wsys.settings.focusshifts[wsys.profile][copied_class])

    --Loop through defup, defprio, keepup and remove any class specific defences
    for k in pairs( wsys.tb.defenceTable ) do
      if not ( wsys.classDefCheck(k, "free") or wsys.classDefCheck(k, wsys.myClass()) ) then
         wsys.settings.defup[wsys.profile][wsys.myClass()][k] = nil
         wsys.settings.defprio[wsys.profile][wsys.myClass()][k] = nil
         wsys.settings.keepup[wsys.profile][wsys.myClass()][k] = nil
      end
    end
    
    wsys.report("Copied " .. copied_class .. " " ..wsys.profile .. " settings into the " .. wsys.myClass() .. " "..wsys.profile .. " profile.")
  end
end

function wsys.switchProfile( name )
  local oldProfile = wsys.profile
  if table.contains(wsys.settings.profilenames, name) then
    wsys.profile = name
    wsys.report("Switched to " .. name .. " profile.")
    -- make sure we have all the right tables already
    if wsys.settings.affprio[wsys.profile][wsys.myClass()] == nil then
      wsys.newclasstables(wsys.myClass())
    end
    -- reset the aff prios
    wsys.resetAllAffPrios()
    -- keep up defs, need to take off the ones I don't want and add those I do want now.
    for k in pairs(wsys.settings.keepup[oldProfile][wsys.myClass()]) do
      if not table.contains(wsys.settings.keepup[name][wsys.myClass()], k) then
        send("curing priority defence " .. k .. " reset", false)
      end
    end
    for k in pairs(wsys.settings.keepup[name][wsys.myClass()]) do
      wsys.enableSSDef( k, wsys.settings.defprio[name][wsys.myClass()][k] )
    end
    -- make sure all the herbs that are needed are precached
    wsys.outrqueue()
  else
    wsys.report(name .. " profile does not exist.")
  end
end

function wsys.deleteProfile( name )
  if name == "basic" then
    wsys.report("Not allowed to delete basic profile!")
  elseif wsys.profile == name then
    wsys.report(name .. " is your current profile. Switch to another before deleting it!")
  elseif table.contains(wsys.settings.profilenames, name) then
    -- remove name from list of profiles
    table.remove(wsys.settings.profilenames, table.index_of(wsys.settings.profilenames, name))
    wsys.settings.affprio[name] = nil
    wsys.settings.defup[name] = nil
    wsys.settings.defprio[name] = nil
    wsys.settings.keepup[name] = nil
    wsys.settings.precache[name] = nil
    wsys.settings.focusshifts[name] = nil
    wsys.report("Deleted the " .. name .. " profile.")
  end
end

local find_differences = function(a, b)
	local diff = {}
	for k,v in pairs(a) do
		if v ~= b[k] then
			diff[k] = { v, b[k] }
		end
	end
	for k,v in pairs(b) do
		if not diff[k] and not a[k] then
			diff[k] = { false, v }
		end
	end
	
	return diff
end

function wsys.resetProfileAffs( class, profile, confirm )
	if not profile or not class then
		return -- Invalid commands. Expects a profile and class
	end
	profile = profile:lower()
	class = class:lower()
	
	if class == "all" then
		-- This is the reset all option
		return
	end

	local prios = wsys.settings.affprio[profile] and wsys.settings.affprio[profile][class]
	
	if not prios then
		wsys.report("Invalid profile combination: '"..profile.."', "..class )
		return
	end
		
	wsys.report("Resetting aff prios for '"..profile.."', "..class )
	local diffs = find_differences( prios, wsys.return_defaultaffprios() )

	-- Update this class/mode prio set to default
	if confirm then
		wsys.settings.affprio[profile][class] = wsys.return_defaultaffprios()
	end
	
	-- Display any changes that occurred
	for aff,changes in pairs(diffs) do
		local display_str = string.format("<white>[<grey>%s<white>][<grey>%s<white>]: %-10s <yellow>%-3s<white>-><green>%3s",
												profile, class, aff, (changes[1] or "nil"), (changes[2] or "nil") )
		
		
		if changes[1] then
			-- If there was an old value, allow reverting
			local command = string.format([[wsys.affprioset("%s", "%s", "%s", "%s" )]], aff, changes[1], profile, class )
			wsys.report("")
			cechoLink( display_str, command, "Revert "..aff.." priority change to " ..changes[1], true)
		else
			-- No previous value, this is a new affliction priority
			wsys.report( display_str )
		end		
	end
	
	if wsys.profile == profile and wsys.myClass() == class then
		wsys.resetAffPrios()
	end
end

function wsys.resetAllProfileAffs( confirm )
	confirm = confirm and confirm == " confirm" or false
	
	if not confirm then
		wsys.report("(Dry run only): No changes will be made")
	end
	for profile,v in pairs(wsys.settings.affprio) do
		for class,prios in pairs(v) do
			wsys.resetProfileAffs( class, profile, confirm )
		end
	end
	if not confirm then
		wsys.report("(Dry run only): Use '<light_grey>wconfig profile resetaff all confirm<white>' to confirm changes.") 
	end
end

function wsys.profileSwitchOnDeath()
  if wsys.profile ~= wsys.settings.profileondeath then
    wsys.switchProfile( wsys.settings.profileondeath )
  end
end

registerAnonymousEventHandler("You Died", "wsys.profileSwitchOnDeath")


function wsys.profileSwitchOnBurst()
  if wsys.profile ~= wsys.settings.profileonburst then
    wsys.switchProfile( wsys.settings.profileonburst )
  end
end

registerAnonymousEventHandler("You Starbursted", "wsys.profileSwitchOnBurst")
