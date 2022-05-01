--gmcp aff added will trigger before this does. Rely on that for determining the level break
if matches[2] == "arms" then
  if wsys.aff.mangledrightarm then
    wsys.restobreakcheck("mangledrightarm")
  else
    wsys.restobreakcheck("damagedrightarm")
  end
  if wsys.aff.mangledleftarm then
    wsys.restobreakcheck("mangledleftarm")
  else
    wsys.restobreakcheck("damagedleftarm")
  end
elseif matches[2] == "legs" then
  if wsys.aff.mangledrightleg then
    wsys.restobreakcheck("mangledrightleg")
  else
    wsys.restobreakcheck("damagedrightleg")
  end
  if wsys.aff.mangledleftleg then
    wsys.restobreakcheck("mangledleftleg")
  else
    wsys.restobreakcheck("damagedleftleg")
  end
end

