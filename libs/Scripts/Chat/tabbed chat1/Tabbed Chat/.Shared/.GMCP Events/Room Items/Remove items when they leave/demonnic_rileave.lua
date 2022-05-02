function demonnic_rileave()
  local item = gmcp.Char.Items.Remove
  if item.location == "room" then
    for name,items in pairs(demonnic.roomItems) do
      for i,id in ipairs(items) do
        if id == tostring(item.item) then
          table.remove(demonnic.roomItems[name],i) 
          if #demonnic.roomItems[name] == 0 then
            demonnic.roomItems[name] = nil
          end
        end
      end
    end
  end
end
