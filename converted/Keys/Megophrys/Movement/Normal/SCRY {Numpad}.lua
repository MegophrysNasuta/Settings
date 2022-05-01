send('scout surroundings')
if Megophrys.class == 'Magi' then
  send('cast scry at '.. target)
elseif Megophrys.class == 'Psion' then
  send('servitor act')
elseif Megophrys.class == 'Blademaster' then
  send('fullsense')
elseif Megophrys.class == 'Apostate' then
  send('demon presences')
end
