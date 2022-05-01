cecho('\n<cyan>LIGHTBIND UP ON '.. matches[2]:title() ..'\n')

if matches[2]:lower() == target:lower() then
  Megophrys.Psion.lightBindUp = true
end
