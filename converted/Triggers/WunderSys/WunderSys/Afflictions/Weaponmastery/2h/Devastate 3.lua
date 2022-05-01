if matches[2] == "arms" then
  wsys.restobreakcheck("mangledrightarm")
  wsys.restobreakcheck("mangledleftarm")
elseif matches[2] == "legs" then
  wsys.restobreakcheck("mangledrightleg")
  wsys.restobreakcheck("mangledleftleg")
end

