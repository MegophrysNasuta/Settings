--defence gained function
function wsys.deffed(d)
  wsys.def[d] = true
  local onKeepup = false
  if wsys.settings.keepup[wsys.profile][wsys.myClass()] ~= nil and wsys.settings.keepup[wsys.profile][wsys.myClass()][d] then onKeepup = true end
  if wsys.settings.defup[wsys.profile][wsys.myClass()][d] and not onKeepup then
    send("curing priority defence "..d.. " reset")
  end
end

--lost def (not stripped)
function wsys.undef(d)
  wsys.def[d] = nil
end

--can't def up because of an error
function wsys.cannotdef(d)
  local onKeepup = false
  if wsys.settings.keepup[wsys.profile][wsys.myClass()] ~= nil and wsys.settings.keepup[wsys.profile][wsys.myClass()][d] then onKeepup = true end
  if wsys.settings.defup[wsys.profile][wsys.myClass()][d] and not onKeepup then
    send("curing priority defence "..d.. " reset")
  end
end

function wsys.defmissingdep(d)
  if wsys.settings.keepup[wsys.profile][wsys.myClass()] ~= nil and wsys.settings.keepup[wsys.profile][wsys.myClass()][d] then 
    wsys.unkeepup(d, true)
  end
end

--defence lost function
function wsys.defstrip(defe)
  wsys.def[wsys.tb.defstripTable[defe]] = false
end -- func

-- enable serverSide defence
function wsys.enableSSDef( defence, priority, silent )
  priority = priority or 25
  local preempt = priority <= 10 and " preempt" or ""
  send("curing priority defence " ..defence.." ".. priority .. preempt, not silent )
end

function wsys.switchDefPrios( def, pos )
  if wsys.settings.keepup[wsys.profile][wsys.myClass()] then
		-- TODO: Check shifts so we don't do it multiple times
  	send("curing priority defence " .. def .. " " .. tostring(pos), true)
  end
end

function wsys.defPrioRestore( def )
	if wsys.settings.keepup[wsys.profile][wsys.myClass()][def] and wsys.settings.defprio[wsys.profile][wsys.myClass()][def] then
		-- TODO: Track shifts so we don't reset multiple times
		send("curing priority defence " .. def .. " " .. tostring(wsys.settings.defprio[wsys.profile][wsys.myClass()][def]), true)
	else
		send("curing priority defence "..def.. " reset")
	end
end

local function get_manual_command( command )
  if type(command) == "function" then
    return command()
  else
    if not type(command) == "string" then cecho("\n<red>Manual commands should be strings or functions: "..command ) end
    return command
  end
end

--defup a certain profile
function wsys.defup(profile)
  profile = profile or wsys.profile
  if table.contains(wsys.settings.defup, profile) then
     wsys.report("Defup - "..wsys.profile)
    wsys.switchProfile( profile )
  else
    wsys.report("Not a valid profile")
    return
  end

  --Ensure we have class tables
  if wsys.settings.affprio[wsys.profile][wsys.myClass()] == nil then
    wsys.newclasstables(wsys.myClass())
  end

  --Channels for Magi, Sylvans and Priests
  if wsys.isClass("magi") or wsys.isClass("sylvan") or wsys.isClass("priest") then
    if wsys.missingChannels() > 0 then
      wsys.defChannels()
    end
  end
  
  if wsys.isClass("priest") or wsys.isClass("paladin") then
    if wsys.settings.havebliss and not (wsys.def.toughness and wsys.def.constitution and wsys.def.resistance) then
      wsys.doadd("perform bliss me")
    end
  end

  -- we need a spiritform thingie too
  for ck,cv in pairs(wsys.settings.defup[wsys.profile][wsys.myClass()]) do 
    if wsys.tb.defenceTable[ck] and wsys.tb.defenceTable[ck]["skillset"][1] == "spiritform" and wsys.tb.defenceTable[ck]["manualcommand"] then
      wsys.doadd( get_manual_command( wsys.tb.defenceTable[ck]["manualcommand"] ))
      -- quit the loop, we're done here
      break
    end
  end
    
  for k,v in pairs(wsys.settings.defup[wsys.profile][wsys.myClass()]) do
    local highestprio = 25
    local highestdef = ""
    local alldefs = {}
    local manualdefs = {}
    --add all defups that aren't deffed and aren't in keepup to the serverside keepup
    if not wsys.def[k] and not wsys.tb.defenceTable[k]["manualcommand"] then
      if wsys.settings.defprio[wsys.profile][wsys.myClass()][k] then
        if wsys.settings.defprio[wsys.profile][wsys.myClass()][k] <= highestprio then
          highestprio = wsys.settings.defprio[wsys.profile][wsys.myClass()][k]
          alldefs[#alldefs+1] = highestdef
          highestdef = "curing priority defence "..k.." ".. wsys.settings.defprio[wsys.profile][wsys.myClass()][k]
        else
          alldefs[#alldefs+1] = "curing priority defence "..k.." ".. wsys.settings.defprio[wsys.profile][wsys.myClass()][k]
        end
      else
        alldefs[#alldefs+1] = "curing priority defence "..k.." 25"
        wsys.settings.defprio[wsys.profile][wsys.myClass()][k] = 25
      end
    elseif not wsys.def[k] and wsys.tb.defenceTable[k]["manualcommand"] then
      manualdefs[#manualdefs+1] = get_manual_command( wsys.tb.defenceTable[k]["manualcommand"] )
    end --if
    send(highestdef, false)
    for k,v in pairs(alldefs) do
      send(v, false)
    end
    for k,v in pairs(manualdefs) do
      send(v, false)
    end
  end --for
  

  --60 second failsafe to remove all defs from serverside keepup, assume they are already deffed.
  if wsys.timer.defup then killTimer(wsys.timer.defup) end
  wsys.timer.defup = tempTimer(60, [[wsys.defupFailsafe();wsys.timer.defup = nil]])
end --fn

--assume anything that hasn't been deffed up yet is deffed
function wsys.defupFailsafe()
  for k,v in pairs(wsys.settings.defup[wsys.profile][wsys.myClass()]) do
    --add all defups that aren't deffed and aren't in keepup to the serverside keepup
    local onKeepup = false
    if wsys.settings.keepup[wsys.profile][wsys.myClass()] ~= nil and wsys.settings.keepup[wsys.profile][wsys.myClass()][d] then onKeepup = true end
    if onKeepup then
      send("curing priority defence "..k.." reset")
      wsys.def[k] = true
    end --if
  end --for
end

local deflines = false

function wsys.defCheckStart()
  deflines = true
  enableTrigger("Def")
  send("def")
  if wsys.timer.defswait then
    killTimer(tostring(wsys.timer.defswait))
  end
  wsys.timer.defswait = tempTimer(wsys.myPing()*2.5, [[wsys.timer.defswait = nil;disableTrigger("Def");deflines = false]])
  if wsys.isClass("sylvan") or wsys.isClass("runewarden") or wsys.isClass("priest") then

  end
end

function wsys.defCheckEnd()
  disableTrigger("Def")
  deflines = false
end

function wsys.defLine(d, msg)
  if deflines then
    wsys.def[d] = true
    deleteLine()
    if msg then
      wsys.def_sub(msg, "newl")
    else
      wsys.def_sub(d, "newl")
    end
  end
end

--add def to keepup
function wsys.keepup(def, gagecho)
  wsys.settings.keepup[wsys.profile][wsys.myClass()][def] = true
  wsys.settings.defprio[wsys.profile][wsys.myClass()][def] = wsys.settings.defprio[wsys.profile][wsys.myClass()][def] or 25
  wsys.enableSSDef( def, wsys.settings.defprio[wsys.profile][wsys.myClass()][def], true )
  if not gagecho then
    wsys.report("Added " .. def .. " to defence keepup in the " ..wsys.profile.. " profile.")
  end
end

--remove def from keepup
function wsys.unkeepup(def, gagecho)
  wsys.settings.keepup[wsys.profile][wsys.myClass()][def] = false
  send("curing priority defence " .. def .. " reset")
  if not gagecho then
    wsys.report("Removed " .. def .. " from defence keepup in the " ..wsys.profile.. " profile.")
  end
end

--toggle def keepup
function wsys.togglekeepup(def, gagecho)
  if wsys.settings.keepup[wsys.profile][wsys.myClass()][def] then
    wsys.unkeepup(def, gagecho)
  else
    wsys.keepup(def, gagecho)
  end
end


--reset all prompt defences
function wsys.promptdefs()
 if not wsys.aff.blackout then
  wsys.def.blindness = false
  wsys.def.cloak = false
  wsys.def.deafness = false
  wsys.def.kola = false
  wsys.def.blackwind = false
  wsys.def.phased = false
  wsys.def.astralform = false
end -- if
end -- func



-- DEFENSES SUB
function wsys.def_sub(defense, newl)
 if newl then
  cinsertText("\n<DarkGoldenrod>(<ivory>" .. defense .. " +<DarkGoldenrod>)")
 else
  cinsertText(" <DarkGoldenrod>(<ivory>" .. defense .. " +<DarkGoldenrod>)")
 end -- if
end -- func

-- DEF ADD SUB
function wsys.defaddsub(defence)
 selectCurrentLine()
 fg("pink")
 deselect()
 resetFormat()
-- deleteLine()
-- cinsertText("\n[<pink>DEF UP<grey>] <pink>" .. defence:upper() .. " <grey>| " .. line)
end -- func

-- DEF Loss SUB
function wsys.deflosssub(defence)
 selectCurrentLine()
 fg("violet_red")
 deselect()
 resetFormat()
-- deleteLine()
-- cinsertText("\n[<violet_red>DEF LOSS<grey>] <violet_red>" .. defence:upper() .. " <grey>| " .. line)
end -- func
