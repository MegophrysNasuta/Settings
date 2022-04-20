wsys.pipes = {
 elmpuffs = 4,
 elmtwopuffs = 4,
 valerianpuffs = 4,
 valeriantwopuffs = 4,
 skullcappuffs = 4,
 skullcaptwopuffs = 4,
 smoking = false,
 nonartiepipes = false,
 unlitpipes = false,
}




local pipeprompt = false

function wsys.smoked(herb)
  wsys.lostBal("smoke", 2)
  if herb == "empty" then
   wsys.emptySmoke(wsys.pipes.smoking)
  else
   if wsys.settings.usetransmutation then
     wsys.pipes[wsys.tb.opps[herb] .. "puffs"] = wsys.pipes[wsys.tb.opps[herb] .. "puffs"] - 1
   else
     wsys.pipes[herb.."puffs"] = wsys.pipes[herb.."puffs"] - 1
   end
   wsys.pipes.smoking = false
  end -- if
  wsys.refillqueue()
  if pipeprompt then killTrigger(tostring(pipeprompt)) end
  if not wsys.aff.blackout then
   pipeprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptypipe(wsys.cure) end]])
  end -- if
end -- func

function wsys.emptySmoke(herb)

end --func

function wsys.smokebal()
  if wsys.timer.smokebal and not wsys.lifevision then
    wsys.gotBal("smoke")
  end
end


function wsys.plist(pipe, herb, num)
 if wsys.settings.elmpipe == pipe then
  if string.match(herb, "empty") then
   wsys.pipes.elmpuffs = 0
  else
   wsys.pipes.elmpuffs = tonumber(num)
  end -- if
 elseif wsys.settings.elmtwopipe == pipe then
  if string.match(herb, "empty") then
   wsys.pipes.elmtwopuffs = 0
  else
   wsys.pipes.elmtwopuffs = tonumber(num)
  end -- if
 elseif wsys.settings.valerianpipe == pipe then
  if string.match(herb, "empty") then
   wsys.pipes.valerianpuffs = 0
  else
   wsys.pipes.valerianpuffs = tonumber(num)
  end -- if
elseif wsys.settings.valeriantwopipe == pipe then
  if string.match(herb, "empty") then
    wsys.pipes.valeriantwopuffs = 0
  else
    wsys.pipes.valeriantwopuffs = tonumber(num)
  end
 elseif wsys.settings.skullcappipe == pipe then
  if string.match(herb, "empty") then
   wsys.pipes.skullcappuffs = 0
  else
   wsys.pipes.skullcappuffs = tonumber(num)
  end -- if
 elseif wsys.settings.skullcaptwopipe == pipe then
  if string.match(herb, "empty") then
    wsys.pipes.skullcaptwopuffs = 0
  else
    wsys.pipes.skullcaptwopuffs = tonumber(num)
  end
 end -- if
 if wsys.pipes.unlitpipes and not wsys.timer.lightpipewait then
  wsys.timer.lightpipewait = tempTimer(0.5, [[wsys.timer.lightpipewait = nil]])
  wsys.dofreeadd("light pipes")
 end
 wsys.refillqueue()
end -- func


function wsys.refill(pipe)
  -- check to make sure pipe exists in settings
  --[=[if pipe then
    enableTrigger("Pipe Refilling")
    if wsys.timer.refillwait then
      killTimer(tostring(wsys.timer.refillwait))
    end
      wsys.timer.refillwait = tempTimer(4, [[wsys.timer.refillwait = nil]])
    if wsys.timer.refillfailsafe then
      killTimer(tostring(wsys.timer.refillfailsafe))
    end
    wsys.timer.refillfailsafe = tempTimer(4, [[wsys.timer.refillfailsafe = nil;wsys.refillqueue()]])

    -- herb or mineral
    local pherb = wsys.pipecurative(pipe)
    -- set up refill string
    local rfstring = "empty " .. pipe
    -- is the herb outrifted?
    if wsys.herbsout[pherb] == 0 then
      rfstring = "outr " .. pherb .. "/" .. rfstring
    end
    -- complete the refill string
    rfstring = rfstring .. "/put " .. pherb .. " in " .. pipe
    -- add to dofree
    wsys.dofreeadd(rfstring)
    
    -- light pipe if needed
    if wsys.pipes.nonartiepipes and not wsys.timer.lightpipewait then
      wsys.timer.lightpipewait = tempTimer(0.5, [[wsys.timer.lightpipewait = nil]])
      wsys.dofreeadd("light pipes")
    end
  end]=]
end


function wsys.refilled(herb)
  disableTrigger("Pipe Refilling")

  if herb == "cinnabar" or herb == "elm" then
    if wsys.pipes.elmpuffs <= 3 then
      wsys.pipes.elmpuffs = 10
    elseif wsys.pipes.elmtwopuffs <= 3 then
      wsys.pipes.elmtwopuffs = 10
    end
  elseif herb == "malachite" or herb == "skullcap" then
    if wsys.pipes.skullcappuffs <= 2 then
      wsys.pipes.skullcappuffs = 10
    elseif wsys.pipes.skullcaptwopuffs <= 2 then
      wsys.pipes.skullcaptwopuffs = 10
    end
  elseif herb == "realgar" or herb == "valerian" then
    if wsys.pipes.valerianpuffs <= 3 then
      wsys.pipes.valerianpuffs = 10
    elseif wsys.pipes.valeriantwopuffs <= 3 then
      wsys.pipes.valeriantwopuffs = 10
    end
  end -- if

  killTimer(tostring(wsys.timer.refillwait))
  wsys.timer.refillwait = nil
  killTimer(tostring(wsys.timer.refillfailsafe))
  wsys.timer.refillfailsafe = nil
  wsys.refillqueue()
end -- func


function wsys.refilledempty(herb)
  if wsys.timer.refillwait then
    disableTrigger("Pipe Refilling")
    if wsys.timer.refillwait then
      killTimer(tostring(wsys.timer.refillwait))
    end
    wsys.timer.refillwait = nil
    wsys.herbsout[herb] = 0
    wsys.osend("outr " .. herb)
    wsys.refillqueue()
  end -- if
end -- func
  


function wsys.refillqueue()
  if wsys.cancure() and not wsys.timer.refillwait and not wsys.tanglecheck() and not wsys.damagedarms() and not wsys.aff.paralysis then
    if not wsys.def.selfishness then
      if wsys.pipes.elmpuffs <= 3 then
        wsys.refill(wsys.settings.elmpipe)
      elseif wsys.pipes.valerianpuffs <= 3 then
        wsys.refill(wsys.settings.valerianpipe)
      elseif wsys.pipes.skullcappuffs <= 2 then
        wsys.refill(wsys.settings.skullcappipe)
      elseif wsys.pipes.elmtwopuffs <= 3 then
        wsys.refill(wsys.settings.elmtwopipe)
      elseif wsys.pipes.valeriantwopuffs <= 3 then
        wsys.refill(wsys.settings.valeriantwopipe)
      elseif wsys.pipes.skullcaptwopuffs <= 2 then
        wsys.refill(wsys.settings.skullcaptwopipe)
      end -- if
    elseif wsys.def.selfishness then
      if wsys.pipes.elmpuffs == 0 then
        wsys.refill(wsys.settings.elmpipe)
      elseif wsys.pipes.valerianpuffs == 0 then
        wsys.refill(wsys.settings.valerianpipe)
      elseif wsys.pipes.skullcappuffs == 0 then
        wsys.refill(wsys.settings.skullcappipe)
      elseif wsys.pipes.elmtwopuffs == 0 then
        wsys.refill(wsys.settings.elmtwopipe)
      elseif wsys.pipes.valeriantwopuffs == 0 then
        wsys.refill(wsys.settings.valeriantwopipe)
      elseif wsys.pipes.skullcaptwopuffs == 0 then
        wsys.refill(wsys.settings.skullcaptwopipe)
      end -- if
    end
  end -- if
end -- func

function wsys.pipelist()
  send("pipelist")
end --func

function wsys.emptyValerianPipes()
  if wsys.pipes.valerianpuffs == 0 and wsys.pipes.valeriantwopuffs == 0 then
    return true
  else
    return false
  end
end

function wsys.emptypipe(herb)
 if herb ~= "skullcap" and herb ~= "malachite" then
  for k,v in pairs(wsys.tb.cures[herb]) do
    wsys.predicted[v] = nil
	
    if wsysf.affs[v] then
      wsysf.core.debug.print(2, "Empty smoke should clear ".. v .."?")
    end
    disableTrigger(string.title(v) .. " -")
  end -- for
 end --if
 wsys.cure = nil
end -- if

-- return the herb for the pipe (string)
function wsys.pipecurative(pipe)
  local ans = ""
  if pipe == wsys.settings.elmpipe or pipe == wsys.settings.elmtwopipe then
    ans = "elm"
  elseif pipe == wsys.settings.valerianpipe or pipe == wsys.settings.valeriantwopipe then
    ans = "valerian"
  elseif pipe == wsys.settings.skullcappipe or pipe == wsys.settings.skullcaptwopipe then
    ans = "skullcap"
  end

  if wsys.settings.usetransmutation then
    ans = wsys.tb.opps[ans]
  end

  return ans
end
