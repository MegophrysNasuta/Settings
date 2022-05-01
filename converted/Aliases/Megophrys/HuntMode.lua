Megophrys.setMode('denizen')
if matches[3] then
  Megophrys.huntingGround = matches[3]
  cecho('\n<cyan>Hunting ground: '..
        Megophrys.huntingGround:title()
        ..'\n')
  Megophrys.setTarget(matches[2])
elseif matches[2] then
  Megophrys.setTarget(matches[2])
end
