cecho('\n<cyan>LIGHTBIND DOWN ON '.. matches[2]:title() ..'\n')

if matches[2]:lower() == target:lower() then
  Megophrys.Psion.lightBindUp = false
end
