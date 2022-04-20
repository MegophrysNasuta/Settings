function ak.setalias(aliasname, changes)
	ak.aliases.lastsend[aliasname] = ak.aliases.lastsend[aliasname] or "unknown"
	ak.aliases[aliasname] = ak.aliases[aliasname] or "random"
	if ak.aliases[aliasname] == changes then return end
	if ak.aliases.lastsend[aliasname] == changes then return end
	--local check = string.split(changes, "parry")
		
	ak.aliases.lastsend[aliasname] = changes
	send("setalias "..aliasname.." "..changes, false)

end

local parrychecks = {
	["right leg"] = true,
}

function ak.parrycut(var)
	if not string.find(var,"parry") then
		return var
	end
	for k,v in pairs(parrychecks) do
		
	end
end

function ak.aliasreset()
	send("setalias oattackrl stand")
	send("setalias oattackll stand")
	send("setalias oattackra stand")
	send("setalias oattackla stand")
	send("setalias oattackh stand")
	send("setalias oattackt stand")
	send("setalias oattack stand")
	send("setalias oattacktwo stand")
end
