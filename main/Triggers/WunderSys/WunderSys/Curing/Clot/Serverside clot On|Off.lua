local clotNum = tonumber(multimatches[2][2])
if clotNum < wsys.stats.maxh then
  wsys.settings.useclot = true
elseif clotNum > wsys.stats.maxh then
  if not wsys.settings.stopclot then
    wsys.settings.useclot = false
  end 
end
