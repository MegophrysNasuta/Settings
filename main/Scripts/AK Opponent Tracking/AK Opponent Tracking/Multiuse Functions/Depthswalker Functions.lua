ak.ShadowList = ak.ShadowList or {}
ak.age = function()
	if svo then
		return svo.stats.age
	elseif wsys then
    if not wsys.stats.age then return 0 end
		return wsys.stats.age 
	end
end

ak.haveshadow = function()
	if table.contains(ak.ShadowList,target:lower():title()) then
		return true
	else
		return false
	end
end

ak.removeshadow = function(name)
    if table.contains(ak.ShadowList,name:lower():title()) then
        table.remove(ak.ShadowList,table.index_of(ak.ShadowList,name:lower():title()))
    end
end

ak.addshadow = function(name)
	if not table.contains(ak.ShadowList,name:lower():title()) then
		table.insert(ak.ShadowList,name:lower():title())
	end
	cecho("<cyan>\nShadow Claimed!\n")
end

ak.instill = function(instill)
	if instill == "Degeneration" then
		if affstrack.score.clumsiness < 100 then
			OppGainedAff("clumsiness")
		elseif affstrack.score.weariness < 100 then
			OppGainedAff("weariness")
		else
			OppGainedAff("paralysis")
		end
	elseif instill == "Depression" then
		if affstrack.score.depression < 100 then
			OppGainedAff("depression")
		elseif affstrack.score.nausea < 100 then
			OppGainedAff("nausea")
		else
			OppGainedAff("hypochondria")
		end
	elseif instill == "Retribution" then
		if affstrack.score.justice < 100 then
			OppGainedAff("justice")
		else
			OppGainedAff("retribution")
		end
	elseif instill == "Madness" then
		if affstrack.score.shadowmadness < 100 then
			OppGainedAff("shadowmadness")
		elseif affstrack.score.vertigo < 100 then
			OppGainedAff("vertigo")
		else
			OppGainedAff("hallucinations")
		end
	elseif instill == "Leach" then
		if affstrack.score.parasite < 100 then
			OppGainedAff("parasite")
		elseif affstrack.score.healthleech < 100 then
			OppGainedAff("healthleech")
		else
			OppGainedAff("manaleech")
		end
	end
end

ak.fullinstill = function(instill)
	if instill == "Degeneration" then
		OppGainedAff("weariness")
		OppGainedAff("clumsiness")
		OppGainedAff("paralysis")
	elseif instill == "Depression" then
		OppGainedAff("depression")
		OppGainedAff("nausea")
		OppGainedAff("hypochondria")
		OppGainedAff("anorexia")
		OppGainedAff("masochism")
	elseif instill == "Retribution" then
		OppGainedAff("justice")
		OppGainedAff("retribution")
	elseif instill == "Madness" then
		OppGainedAff("shadowmadness")
		OppGainedAff("vertigo")
		OppGainedAff("hallucinations")
	elseif instill == "Leach" then
		OppGainedAff("parasite")
		OppGainedAff("healthleech")
		OppGainedAff("manaleech")
		ak.addshadow()
	end
end
