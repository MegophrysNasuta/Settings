if matches[2] then
  if matches[2] == "on" then
    wsys.keepup("mass", true)
    wsys.report("<yellow>Maintaining MASS")
  elseif matches[2] == "off" then
    wsys.unkeepup("mass", true)
    wsys.report("<yellow>No longer keeping MASS")
  end
else
  wsys.togglekeepup("mass")
end
