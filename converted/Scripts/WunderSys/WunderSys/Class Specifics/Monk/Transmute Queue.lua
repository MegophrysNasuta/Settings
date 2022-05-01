wsys.transmuting = false

function wsys.transmutequeue()
	if wsys.settings.monktransmute then
	if wsys.cancure() and wsys.isClass("monk") and not wsys.aff.prone and not wsys.aff.blackout and not wsys.aff.recklessness then
	local transmuteToHP = math.ceil(wsys.stats.maxh * (wsys.settings.monktransmuteto / 100))
	if wsys.stats.m>wsys.manathreshold() and (not (wsys.aff.aeon or wsys.retard)) then
		local manaleft = wsys.stats.m - wsys.manathreshold()
		local missingHealth = missinghealth or (transmuteToHP - gmcp.Char.Vitals.hp)
		--is there any health to transmute?
		if missingHealth > 1 then
			--check if health needed is greater than mana left
			if missingHealth > manaleft then
				wsys.transmuteHelper(manaleft)
				wsys.transmuting = true
			else
				--have enough mana to 
				wsys.transmuteHelper(missingHealth)
				wsys.transmuting = true
			end
		end
	end
	end -- if cancure check
	end
end

function wsys.transmuteHelper(n)
	if n > 1000 and wsys.stats.m > 1000 then
		wsys.osend("transmute " .. 1000)
		n = n - 1000
		wsys.transmuteHelper(n)
	else
		wsys.osend("transmute " .. n)
		wsys.transmuting = false
	end
end

function wsys.transmuted()

end


function wsys.transmuteToFull()
	if wsys.stats.m>wsys.manathreshold() and (not svo.inslowcuringmode()) then
		local missingHealth = gmcp.Char.Vitals.maxhp - gmcp.Char.Vitals.hp
		--echo("missinghealth calced " .. missingHealth)
		wsys.transmuteHelper(missingHealth)
	end
end

--transmute 200 if mana is full and health not
function wsys.miniTransmute()
	if (wsys.stats.h < (wsys.stats.maxh - 200)) and (wsys.stats.h >= (wsys.stats.maxh * 0.99)) then
		wsys.osend("transmute 200")
	end
end
