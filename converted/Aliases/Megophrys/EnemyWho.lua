enableTrigger('suppress_enw_spam')

for _, enemy in pairs(Megophrys.enemies or {}) do 
  send('qw '.. enemy)
end

tempTimer(.5, function()
  disableTrigger('suppress_enw_spam')
end)
