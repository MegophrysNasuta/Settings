function wsys.updateSettingsTable()

  if wsys.settings.autotree == nil then
    wsys.settings.autotree = false
    wsys.report("Added the 'autotree' setting at default value <red>false")
  end
  
end

wsys.updateSettingsTable()
wsys.saveSettings()
