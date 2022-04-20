function wsys.proneSensiRevert(event, affliction)
  if event == "lost aff" then
    if affliction == "prone" then
      wsys.affPrioRestore( "sensitivity" )
    end
  end
end

registerAnonymousEventHandler("lost aff", "wsys.proneSensiRevert")


function wsys.proneSensi(event, affliction, class)
  if event == "got aff" then
    if affliction == "prone" then
      if wsys.damagedlegs() then wsys.switchPrios("sensitivity", 1) end
    elseif affliction == "damagedleftleg" then
      if wsys.aff.prone then wsys.switchPrios("sensitivity", 1) end
    elseif affliction == "damagedrightleg" then
      if wsys.aff.prone then wsys.switchPrios("sensitivity", 1) end
    end --if
  end --if
end --func

registerAnonymousEventHandler("got aff", "wsys.proneSensi")
