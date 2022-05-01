if not matches[2] then
  wsys.stats.kai = 0
  wsys.stats.shin = 0
else
  if wsys.isClass("monk") then
    wsys.stats.kai = tonumber(matches[2])
    wsys.def.kaitrance = true
  elseif wsys.isClass("blademaster") then
    wsys.stats.shin = tonumber(matches[2])
    wsys.def.shintrance = true
  end
end
