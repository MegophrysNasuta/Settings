function wsys.unsoftpauseScenarios(event, affliction, class)
  if event == "got aff" and wsys.softpaused then
    if affliction == "paralysis" and not propping then
      wsys.unsoftpause()
    elseif affliction == "prone" then
      wsys.unsoftpause()
    elseif affliction == "webbed" and not propping then
      wsys.unsoftpause()
    elseif affliction == "transfixation" and not propping then
      wsys.unsoftpause()
    elseif affliction == "impaled" then
      wsys.unsoftpause()
    elseif affliction == "anorexia" and not propping then
      wsys.unsoftpause()
    elseif affliction == "sleeping" and not propping then
      wsys.unsoftpause()
    elseif affliction == "asthma" and not propping then
      wsys.unsoftpause()
    elseif affliction == "daeggerimpale" then
      wsys.unsoftpause()
    elseif affliction == "speared" then
      wsys.unsoftpause()
    elseif affliction == "entangled" then
      wsys.unsoftpause()
    elseif affliction == "bound" then
      wsys.unsoftpause()
    end
  end --if
end

registerAnonymousEventHandler("got aff", "wsys.unsoftpauseScenarios")
