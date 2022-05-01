function wsys.GMCPRefreshRoomExits()
  if wsys.def.alertness then
    -- if we dont have alertness, theres no need to track this..
    exits = {}
    for i,v in pairs(gmcp.Room.Info.exits) do
      if i == 'e' then
        exits[getRoomName(v)] = 'east'
      elseif i == 'se' then
        exits[getRoomName(v)] = 'southeast'
      elseif i == 's' then
        exits[getRoomName(v)] = 'south'
      elseif i == 'sw' then
        exits[getRoomName(v)] = 'southwest'
      elseif i == 'w' then
        exits[getRoomName(v)] = 'west'
      elseif i == 'nw' then
        exits[getRoomName(v)] = 'northwest'
      elseif i == 'n' then
        exits[getRoomName(v)] = 'north'
      elseif i == 'ne' then
        exits[getRoomName(v)] = 'northeast'
      elseif i == 'd' then
        exits[getRoomName(v)] = 'down'
      elseif i == 'u' then
        exits[getRoomName(v)] = 'up'
      elseif i == 'in' then
        exits[getRoomName(v)] = 'in'
      elseif i == 'out' then
        exits[getRoomName(v)] = 'out'
      end
    end
  end
end

registerAnonymousEventHandler("gmcp.Room.Info", "wsys.GMCPRefreshRoomExits")
