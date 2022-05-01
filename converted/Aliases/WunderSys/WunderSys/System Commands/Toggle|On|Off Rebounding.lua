if matches[2] then
  if matches[2] == "on" then
    wsys.keepup("rebounding", false)
    wsys.report("Maintaining REBOUNDING")
  elseif matches[2] == "off" then
    wsys.unkeepup("rebounding", false)
    wsys.report("No longer keeping rebounding")
  end
else
  wsys.togglekeepup("rebounding")
end
