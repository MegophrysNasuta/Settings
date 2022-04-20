-- roomitems table
wsys.roomitems = wsys.roomitems or {}

--new Items list on moving rooms
function wsys.updateroomitems()
  wsys.roomitems = {}
  for k,v in pairs(gmcp.Char.Items.List.items) do
    wsys.roomitems[v.id] = v.name
  end -- for
  raiseEvent("roomitems changed")
end

registerAnonymousEventHandler("gmcp.Char.Items.List", "wsys.updateroomitems")

--item added to room
function wsys.addroomitem()
  --check if item was added to room
  if gmcp.Char.Items.Add.location == "room" then
    --check if item is already in roomitems table
    if not table.contains(wsys.roomitems, gmcp.Char.Items.Add.item.id) then
      wsys.roomitems[gmcp.Char.Items.Add.item.id] = gmcp.Char.Items.Add.item.name
      raiseEvent("roomitems changed")
    end
  end
end

--manually add item to room
function wsys.manualAddItem(id, name)
  if not table.contains(wsys.roomitems, id) then
    wsys.roomitems[id] = name
    raiseEvent("roomitems changed")
  end
end

registerAnonymousEventHandler("gmcp.Char.Items.Add", "wsys.addroomitem")

--item removed from room
function wsys.removeroomitem()
  if gmcp.Char.Items.Remove.location == "room" then
    if table.contains(wsys.roomitems, gmcp.Char.Items.Remove.item.id) then
      wsys.roomitems[gmcp.Char.Items.Remove.item.id] = nil
      raiseEvent("roomitems changed")
    end
  end
end

--manually remove person leaving room from people_here
function wsys.manualRemoveItem(id)
  if table.contains(wsys.roomitems, id) then
    wsys.roomitems[id] = nil
    raiseEvent("roomitems changed")
  end
end

registerAnonymousEventHandler("gmcp.Char.Items.Remove", "wsys.removeroomitem")
