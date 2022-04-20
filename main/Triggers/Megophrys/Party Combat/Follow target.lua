if target:lower() ~= matches[3]:lower() then
  cecho('\n<cyan>Following '.. matches[2] ..'\'s target: '.. matches[3] ..'\n')
  Megophrys.setTarget(matches[3])
end
