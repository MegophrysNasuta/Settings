Megophrys.fullSensed = (Megophrys.fullSensed or {})
Megophrys.fullsenseDisplayTimer = (Megophrys.fullsenseDisplayTimer or nil)
local fsTimer = Megophrys.fullsenseDisplayTimer

if matches[1]:starts('Focusing') then
  Megophrys.fullSensed = {}
end

if not Megophrys.fullSensed[matches[3]] then
  Megophrys.fullSensed[matches[3]] = {matches[2]}
else
  local tbl = Megophrys.fullSensed[matches[3]]
  tbl[#tbl + 1] = matches[2]
end

if fsTimer then killTimer(fsTimer) end
Megophrys.fullsenseDisplayTimer = tempTimer(0.2, function()
  echo('\n')
  for location, players in spairs(Megophrys.fullSensed) do
    if location:len() > 28 then
      location = location:cut(26) ..'...'
    end
    local spacer = string.rep(' ', 30 - location:len())
    echo(location ..':'.. spacer .. table.concat(players, ', ') ..'\n')
  end
end)
