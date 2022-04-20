opsec = (opsec or {})
opsec.checkWormholesAlways = false
opsec.checkedRooms = (opsec.checkedRooms or {})
opsec.checkedSlots = {}

opsec.doCommand = function(cmds)
  if opsec.wait then
    cecho('Pausing opsec run temporarily...')
    opsec.wait = false
    local wait_for = 8
    if not opsec.checkWormholes and not opsec.checkWormholesAlways then
      wait_for = 4
    end
    opsec.runTimer = tempTimer(wait_for, function() opsec.doCommand(cmds) end)
  else
    if table.is_empty(cmds) then
      killTimer(opsec.runTimer)
      cecho('\nOpsec run finished!\n')
      expandAlias('opsec display')
      opsec.checkWormholes = true
      if opsec.lastPose then send('pose '.. opsec.lastPose) end
      opsec.posed = false
      return
    end
    if not opsec.posed then
      send('pose')
      send('pose Scribbling notes, ^ is here, eyeing the totem '..
           'up and down and tut-tutting.')
      opsec.posed = true
    end
    if gmcp.Room.Players and #gmcp.Room.Players > 1 then
      send('em scribbles some notes while glancing at a totem, '..
           'before busily hurrying off.')
    end
    expandAlias('opsec')
    local timer_in = 3.5
    if cmds[#cmds]:starts('goto') then
      expandAlias(cmds[#cmds])
      timer_in = 5
    else
      send(cmds[#cmds])
    end
    table.remove(cmds, #cmds)
    if not opsec.checkWormholes and not opsec.checkWormholesAlways then
      if timer_in == 5 then timer_in = 2.75 else timer_in = 1.75 end
    end
    opsec.runTimer = tempTimer(timer_in, function() opsec.doCommand(cmds) end)
  end
end

if matches[2] == 'display' then
  for roomID, info in pairs(opsec.checkedRooms) do
    cecho('\nAt '.. info.name ..' ('.. roomID ..'):\n')
    for _, problem in pairs(info.report) do
      cecho('\t'.. problem ..'\n')
    end
  end
  cecho('\nWormholes found:\n')
  display(opsec.wormholes)
elseif matches[2] == 'logreport' then
  local report = 'Totems damaged at: '
  if #opsec.checkedRooms then
    for roomID, info in pairs(opsec.checkedRooms) do
      report = report .. info.name .. ' ('.. roomID ..'); '
    end
    --cecho('\n'.. report ..'\n')
    send('writelog '.. gmcp.Char.Status.city:lower() ..' '.. report)
  end
elseif matches[2] == 'reset' then
  opsec.checkedRooms = {}
  opsec.wormholes = {}
  cecho('\n<cyan>opsec.checkedRooms and opsec.wormholes reset\n')
else  
  enableTrigger('opsec_checktotem_runes')
  enableTrigger('opsec_checktotem_loyalty')
  enableTrigger('opsec_checktotem_empower')
  enableTrigger('opsec_checkmono_flame')
  enableTrigger('opsec_missing_item')
  enableTrigger('opsec_grossshitonground')
  enableTrigger('opsec_yeswormhole')
  
  opsec.totem_empowered = 0
  opsec.flame_rune_found = 0
  
  sendAll('p totem', 'p monolith')
  if opsec.checkWormholes or opsec.checkWormholesAlways then
    send('wormholes')
  end
  
  tempTimer(.75, function()
    local roomId = gmcp.Room.Info.num
    local report = {}
    if (opsec.flame_rune_found == 0) then
      cecho('\n<red>Monolith sigil at '.. gmcp.Room.Info.name ..' missing flame rune!')
    end
    disableTrigger('opsec_checktotem_runes')
    disableTrigger('opsec_checktotem_loyalty')
    disableTrigger('opsec_checktotem_empower')
    disableTrigger('opsec_checkmono_flame')
    disableTrigger('opsec_missing_item')
    disableTrigger('opsec_grossshitonground')
    disableTrigger('opsec_yeswormhole')
    local checkSlot = 1
    while checkSlot <= 6 do 
      local slotVal = opsec.checkedSlots[tostring(checkSlot)]
      if slotVal ~= 'OK' then
        report[checkSlot] = 'slot '.. tostring(checkSlot) ..' has '.. (slotVal or 'been smudged')
      end
      checkSlot = checkSlot + 1
    end
    
    if (opsec.totem_empowered == 0) then
      cecho('<cyan>TOTEM SETUP WARNING: Totem not empowered.')
      --report[#report + 1] = "Totem not empowered"
    end
    
    if #report > 0 then
      opsec.checkedRooms[roomId] = {
        name = gmcp.Room.Info.name,
        report = report
      }
    end
  end)
end

if not (opsec.checkWormholes == true or opsec.checkWormholes == false) then
  opsec.checkWormholes = true
end
