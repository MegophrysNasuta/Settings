if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then
  local presend = ""
  local postsend = ""
  if wsys.def.phased then
    postsend = "|look at shrine|look at guard"
  end
	if TumbleEngaged then
    send(presend.."out"..postsend)
  else
    send("queue addclear eqbal " .. presend .. "out" .. postsend)
	end
else
	if ak.defs.curseward then 
		ak.defs.curseward = false
		cecho("\n\n<cyan> WARDING TURNED OFF!")
		ak.scoreup(target)
	else 
		ak.defs.curseward = true
		cecho("\n\n<cyan> WARDING TURNED ON!")
		ak.scoreup(target)
	end
end
