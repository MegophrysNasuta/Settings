function demonnic_rilist()
  local list = gmcp.Char.Items.List
  if list.location == "room" then
    demonnic.roomItems = {}
    for _,v in ipairs(list.items) do
      if not demonnic.roomItems[v.name] then demonnic.roomItems[v.name] = {} end
      table.insert(demonnic.roomItems[v.name], v.id)
    end
  end
  if list.location == "inv" then
    return
  end
end
