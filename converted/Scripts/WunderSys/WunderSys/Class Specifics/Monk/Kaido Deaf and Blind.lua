function wsys.deafHerbQueueCount()

	local herbsToGo = 0
	
	if wsys.aff.paralysis then herbsToGo = herbsToGo + 1 end
	if wsys.aff.impatience then herbsToGo = herbsToGo + 1 end
	if wsys.aff.scytherus then herbsToGo = herbsToGo + 1 end
	if wsys.aff.asthma then herbsToGo = herbsToGo + 1 end
	if wsys.aff.sensitivity then herbsToGo = herbsToGo + 1 end
	if wsys.aff.darkshade then herbsToGo = herbsToGo + 1 end
	if wsys.aff.hypersomnia then herbsToGo = herbsToGo + 1 end
	if wsys.aff.hallucinations then herbsToGo = herbsToGo + 1 end
	if wsys.aff.confusion then herbsToGo = herbsToGo + 1 end
	if wsys.aff.stupidity then herbsToGo = herbsToGo + 1 end
	if wsys.aff.epilepsy then herbsToGo = herbsToGo + 1 end
	if wsys.aff.recklessness then herbsToGo = herbsToGo + 1 end
	if wsys.aff.masochism then herbsToGo = herbsToGo + 1 end
	if wsys.aff.nausea then herbsToGo = herbsToGo + 1 end
	if wsys.aff.haemophilia then herbsToGo = herbsToGo + 1 end
	if wsys.aff.lethargy then herbsToGo = herbsToGo + 1 end
	if wsys.aff.loneliness then herbsToGo = herbsToGo + 1 end
	if wsys.aff.shyness then herbsToGo = herbsToGo + 1 end
	if wsys.aff.recklessness then herbsToGo = herbsToGo + 1 end
	if wsys.aff.masochism then herbsToGo = herbsToGo + 1 end
	if not wsys.def.blindness then herbsToGo = herbsToGo + 1 end
	
	return herbsToGo
	
end


function wsys.deafOrHerb()
	if wsys.deafHerbQueueCount() >= 1 and not wsys.def.deafness and wsys.isClass("monk") then
		useDeaf()
	end
end

function wsys.useDeaf()
	if not wsys.timer.monkdeafing then
		wsys.timer.monkdeafing = tempTimer(6.3, [[wsys.timer.monkdeafing = nil]])
		wsys.osend("deaf")
	end
end

function wsys.blindOrHerb()
	if wsys.deafHerbQueueCount() >= 3 and not wsys.def.blindness and wsys.isClass("monk") then
		wsys.useBlind()
	end
end

function wsys.useBlind()
	if not wsys.timer.monkblinding then
		wsys.timer.monkblinding = tempTimer(6.4, [[wsys.timer.monkblinding = nil]])
		wsys.osend("blind")
	end
end
