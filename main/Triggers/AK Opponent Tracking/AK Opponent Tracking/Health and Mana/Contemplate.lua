ak.currentmana = matches[3]
ak.maxmana = matches[4]
local currMana = math.ceil((matches[3]/matches[4])*100)
cecho("\n<white>[<blue>Mana<white>]: <yellow>"..currMana.."%")
if not ak.pause then send("pt "..matches[2].."'s mana at "..ak.currentmana.."/"..ak.maxmana) end
if (currMana <= 40) then
	cecho("\n READY TO GO!!")
end

