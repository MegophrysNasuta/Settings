if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then
  local presend = ""
  local postsend = ""
  if wsys.def.phased then
    postsend = "|look at shrine|look at guard"
  end
	if TumbleEngaged then
    send(presend.."ne"..postsend)
  else
    send("queue addclear eqbal " .. presend .. "ne" .. postsend)
  end
end