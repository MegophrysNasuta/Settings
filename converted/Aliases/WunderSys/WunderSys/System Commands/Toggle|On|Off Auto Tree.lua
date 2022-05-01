if matches[2] then
  if matches[2] == "on" then
    wsys.autoTreeOn()
  elseif matches[2] == "off" then
    wsys.autoTreeOff()
  end
else
  wsys.toggleAutoTree()
end
