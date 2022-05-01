if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then
  local presend = ""
  local postsend = ""
  if wsys.def.phased then
    postsend = "|look at shrine|look at guard"
  end
		if TumbleEngaged then
    send(presend.."up"..postsend)
  else
    send("queue addclear eqbal " .. presend .. "up" .. postsend)
	end
else
	ak.scoreup(target)
	ak.illusions_send()
	if gmcp.Char.Status.race:match("Dragon") == "Dragon" then 
	   send("conjure " ..target.. " illusion " .. illusion)
	elseif gmcp.Char.Status.class == "Serpent" then 
	   send("conjure " ..target.. " illusion " .. illusion)
	elseif gmcp.Char.Status.class == "Magi" or gmcp.Char.Status.class == "Sylvan" then
	   send("cast " ..target.. " illusion " .. illusion)
	end
	illusionredo = 1
end
