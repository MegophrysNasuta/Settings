if wsys.settings.gstuff then
 wsys.settings.gstuff = false
 wsys.report("<gold>No longer picking up gold, shards, and bodies.")
else
 wsys.settings.gstuff = true
 wsys.report("<gold>Picking up gold, shards, and bodies now.")
 wsys.balqueue()
end -- if
