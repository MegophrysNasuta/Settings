local rune = matches[3]
local slot = matches[4]

if (gmcp.Room.Info.area == 'Targossas') then
  if ((slot == '3') and (rune ~= 'a butterfly')) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slot 3 is usually nairat.')
  elseif (((slot == '1') or (slot == '2')) and (rune ~= 'an open eye')) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slots 1 & 2 are usually wunjo.')
  elseif (((slot == '4') or (slot == '5') or (slot == '6')) and (rune ~= 'a closed eye')) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slots 4 - 6 are usually fehu.')
  else
    if (slot ~= '3') then cecho('\t') end
    cecho('\t\t<cyan>OK.')
    opsec.checkedSlots[slot] = 'OK'
  end
elseif (gmcp.Room.Info.area == 'Hashan' or gmcp.Room.Info.area == 'Mhaldor') then
  if ((slot == '1') and (rune ~= 'an open eye')) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slot 1 is usually wunjo.')
  elseif ((slot == '2') and ((rune ~= 'a bell') and (rune ~= 'an open eye'))) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slot 2 is usually wunjo or mannaz.')
  elseif ((slot == '3') and ((rune ~= 'a butterfly') and
          (rune ~= 'an open eye') and (rune ~= 'a nail'))) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slot 3 is usually nairat, wunjo, or sowulu.')
  elseif (((slot == '4') or (slot == '5') or (slot == '6')) and
          ((rune ~= 'a butterfly') and (rune ~= 'a closed eye') and
           (rune ~= 'a nail'))) then
    cecho('\n<cyan>TOTEM SETUP WARNING: Slots 4 - 6 are usually nairat, fehu, or sowulu.')
  else
    if ((rune == 'an open eye') or (rune == 'a bell') or
        ((rune ~= 'a butterfly') and (rune ~= 'a nail') and
            ((slot == '4') or (slot =='5') or (slot == '6')))) then cecho('\t') end
    cecho('\t\t<cyan>OK.')
    opsec.checkedSlots[slot] = 'OK'
  end
end

if opsec.checkedSlots[slot] ~= 'OK' then
  opsec.checkedSlots[slot] = rune
end
