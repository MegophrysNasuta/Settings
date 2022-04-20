-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.shikudo.AliasSplit(blah)
	ak.shikudo.AttackAlias = {}
	local checktable = blah
	local attacks = {"ruku","kuro", "hiru", "nervestrike","livestrike", "dart", "hiraku", "thrust", "needle"}
	for i = 1, #blah do
		if table.contains(attacks,blah[i]) then
			if blah[i+1] and blah[i+1] == "light" then
				table.insert(ak.shikudo.AttackAlias,"light")
			else
				table.insert(ak.shikudo.AttackAlias,"regular")
			end
		end
	end
end

function ak.shikudo.LimbBlock()
	ak.shikudo.AttackAlias = ak.shikudo.AttackAlias or {}
	if #ak.shikudo.AttackAlias > 0 then
		if ak.shikudo.AttackAlias[1] == "light" then
			return true	
		end
		table.remove(ak.shikudo.AttackAlias,1)
	end
	return false
end
