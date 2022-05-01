if gmcp.Char.Status.class == 'Magi' then
  send('cast scry at '..(matches[2] or target))
elseif gmcp.Char.Status.class == 'Blademaster' then
  send('detect '..(matches[2] or target))
elseif gmcp.Char.Status.class == 'Alchemist' then
  send('ether seek '..(matches[2] or target))
elseif gmcp.Char.Status.class == 'Apostate' then
  send('sense '..(matches[2] or target))
else
  send('farsee '..(matches[2] or target))
end
