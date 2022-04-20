if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then
   send("ql")
elseif gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] == "Spec: Dual Cutting" then
	if ak.stack == "dwckelp" then
		ak.stack = "dwcstupid"
		ak.scoreup(target)
	else
		ak.stack = "dwckelp"
		ak.scoreup(target)
	end 
end
