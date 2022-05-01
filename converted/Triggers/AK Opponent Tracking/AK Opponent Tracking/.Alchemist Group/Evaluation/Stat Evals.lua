if matches[3] == "health" then
	ak.currenthealth = tonumber(matches[4])
	ak.maxhealth = tonumber(matches[5])
	ak.healthpercent = ak.currenthealth / ak.maxhealth * 100
	cecho("<green>"..ak.healthpercent.."%")
	ak.knownmaxhealth[target] = tonumber(matches[5])
elseif matches[3] == "mana" then
	ak.currentmana = tonumber(matches[4])
	ak.maxmana = tonumber(matches[5])
	ak.manapercent = ak.currentmana / ak.maxmana * 100
	cecho("<blue>"..ak.manapercent.."%")
end

if ak.healthpercent <= 60 and ak.manapercent <= 60 then
	send("queue prepend eqbal aurify " .. target)
end
