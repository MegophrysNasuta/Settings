wsys.firequeues()
disableTrigger("Prompt Checks")

if next(wsys.tb.justreckless) then
 if wsys.stats.h == wsys.stats.maxh and wsys.stats.m == wsys.stats.maxm and not wsys.lifevision then
  moveCursor("main", 0, wsys.tb.justreckless[2])
  wsys.affprint("recklessness", wsys.tb.justreckless[1])
	wsys.affpredict( "recklessness" )
  --herbqueue()
 end -- if
 wsys.tb.justreckless = {}
end -- func


if next(wsys.tb.restorationlist) then
  local is_real = ((wsys.aff.recklessness or wsys.absorbed) or ((wsys.stats.h < wsys.stats.oh) or wsys.puppetmangle) or wsys.aff.blackout) and not wsys.lifevision
  for k,v in ipairs(wsys.tb.restorationlist) do
    local aff = v[1]
    --Announce breaks regardless of checks if we know we have the affliction already
    if is_real or wsys.aff[aff] then
      wsys.brokenLimbListener("got aff", v[1])
			
      wsys.affadd(v[1])
			
      local leg = v[1]:find("leg")
      local arm = v[1]:find("arm")
			
      wsys.boxDisplay(v[1] .. " BROKE!", ( (leg or arm) and "white" or "LightGray")..":"..(leg and "orange" or "orange_red") )
    end
  end -- for
end

wsys.puppetmangle = false
wsys.tb.restorationlist = {}
wsys.absorbed = false
wsys.lifevision = false
wsys.self_illusion = false

--Starburst situations
if wsys.starbursted then
 if not wsys.def.blindness and not wsys.def.deafness and not wsys.def.kola then
  raiseEvent("You Starbursted")
	
  --wsys.aff = {}
  for k,v in pairs(wsys.herbsout) do
   wsys.herbsout[k] = 0
  end -- for
  for k in pairs(wsys.def) do
   wsys.def[k] = false
  end -- for
  wsys.cleartimers()
  cecho("\n<red>[<orange>STARBURST<red>]")
 end -- if
 wsys.lostallchannels()
 wsys.starbursted = false
end -- if

if wsys.mogged then
 if not wsys.def.blindness and not wsys.def.deafness and not wsys.def.kola then
  --wsys.aff = {}
  for k in pairs(wsys.def) do
   wsys.def[k] = false
  end -- for
  wsys.cleartimers()
  cecho("\n<red>[<orange>MOGGED<red>]")
 end --if
 wsys.mogged = false
end -- if

forced = nil

