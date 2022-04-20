-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
ak.enemyprio.salve = ak.enemyprio.salve or {}
ak.enemyprio.salve[target] = ak.enemyprio.salve[target] or {}

ak.tieredaffs = {"rightleg 100","rightleg 200","rightleg 300","leftleg 100","leftleg 200","leftleg 300","rightarm 100","rightarm 200","rightarm 300","leftarm 100","leftarm 200","leftarm 300",
                 "head 100","head 200","head 300","torso 100","torso 200","torso 300"}
local ignored = {"rightleg","leftleg","rightarm","leftarm","torso","head"}
local salvelocations = {"head","legs","arms","torso"}

function ak.enemyprio.applied(salve)
	if not table.contains(salvelocations,salve) then 
		return 
	end
	ak.enemyprio.salve[target] = ak.enemyprio.salve[target] or {}
	local maxinteger = 0
	local compsplit = ""
	local fuck = ak.enemyprio.salve[target]
	local aff = {}
	local insertpoint = false
	if #fuck > 0 then
		for i = 1, #affstrack.applied[salve] do
			if affstrack.score[affstrack.applied[salve][i]] > 0 then
				aff[affstrack.applied[salve][i]] = affstrack.score[affstrack.applied[salve][i]]
			end
		end
	end
	for k,v in pairs(aff) do
		if table.contains(fuck, k.." "..v) then
			table.remove(fuck,table.index_of(fuck, k.." "..v))
		end
	end
	if #fuck > 0 then
		for i = 1, #fuck do
			compsplit = string.split(fuck[i], " ")
			if affstrack.score[compsplit[1]] == (compsplit[2] + 0) then
				if insertpoint then
					for k,v in pairs(aff) do
						if not table.contains(fuck, k.." "..v) then
							table.insert(fuck, insertpoint, k.." "..v)
						end
					end				
				else
					for k,v in pairs(aff) do
						if not table.contains(fuck, k.." "..v) then
							table.insert(fuck, i, k.." "..v)
						end
					end
				end
				insertpoint = false
			else--if ak.enemyprio.notHigherAff(compsplit[1], k) --donothaft hisaffliction
				insertpoint = i
			end
		end
	end
	for k,v in pairs(aff) do
		if not table.contains(fuck, k.." "..v) then
			table.insert(fuck, k.." "..v)
		end
	end	
	for k,v in pairs(affstrack.applied) do --add to table
		if table.contains(salvelocations, k) then
			for i = 1, #v do
				if affstrack.score[v[i]] > 0 and not table.contains(fuck, v[i].." "..affstrack.score[v[i]]) then
					table.insert(fuck, v[i].." "..affstrack.score[v[i]])
				else--already in the table but in the wrong spot / has a score currently
	
				end	
			end
		end
	end
	if ak.debug then
		cecho("enemysalveprio")
		display(fuck)
	end
end

function ak.enemyprio.notHigherAff(aff, aff2)
	local compslit = ""
	local compslit2 = ""
	compsplit = string.split(aff, " ")
	compsplit2 = string.split(aff2, " ")
	if compsplit[1] == compslit[2] then
		return false
	else
		return true
	end


end


