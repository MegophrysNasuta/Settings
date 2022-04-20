function demonnic_riadd()
  local item = gmcp.Char.Items.Add
  if item.location == "room" then 
    item = item.item 
    if not demonnic.roomItems[item.name] then demonnic.roomItems[item.name] = {} end
    table.insert(demonnic.roomItems[item.name], item.id)
  end
end
