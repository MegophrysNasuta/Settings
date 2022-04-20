--otherwise it tries to look for wsys.myClass() in gmcp and crashes.
function wsys.manualdeathsight()
  if wsys.settings.havedeathsight then
    local dprio = 25
    if wsys.settings.defprio[wsys.profile][wsys.myClass()] ~= nil then dprio = (wsys.settings.defprio[wsys.profile][wsys.myClass()]["deathsight"] or 25) end
    return "curing priority defence deathsight " .. dprio
  else
    if wsys.settings.usetransmutation then
      return "outr azurite;eat azurite"
    else
      return "outr skullcap;eat skullcap"
    end
  end
end
