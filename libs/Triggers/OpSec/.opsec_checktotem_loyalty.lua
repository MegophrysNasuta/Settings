totem_target = matches[2]
if totem_target ~= 'enemies of the City of '.. gmcp.Room.Info.area then
  cecho('\n<cyan>TOTEM SETUP WARNING: Tune '..
        'against enemies of '.. gmcp.Room.Info.area ..
        ', not '.. totem_target ..'.')
  opsec.checkedSlots[7] = totem_target
else cecho('\t\t<cyan>OK.') end
