ak.clampd = ak.clampd or {}
function ak.limbs.clampOn(who)
	if ak.knownmaxhealth[who] and not table.contains(ak.clampd,who) then
		cecho("\n\n<cyan>MIND CLAMP ON <white>"..who.."\n\n")
		ak.knownmaxhealth[who] = ak.knownmaxhealth[who] * .8
		table.insert(ak.clampd,who)
	end
	ak.scoreup(who)
end

function ak.limbs.clampOFF(who)
	if ak.knownmaxhealth[who] and table.contains(ak.clampd,who) then
		cecho("\n\n<cyan>LOST CLAMP ON <white>"..who.."\n\n")
		table.remove(ak.clampd,table.index_of(ak.clampd, who))
		ak.knownmaxhealth[who] = ak.knownmaxhealth[who] * 5/4
	end
	ak.scoreup(who)
end
