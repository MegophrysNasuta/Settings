if wsys.curingstatuscheck then deleteLine() end
if matches[2] == "Yes" then
  wsys.settings.autotree = true
elseif matches[2] == "No" then
  wsys.settings.autotree = false
end
