if matches[2]:lower()=="set" then
	talisman.tradeset(matches[3], matches[4], matches[6])
elseif matches[2]:lower()=="talisman" then
	talisman.tradetalisman(matches[3], matches[4], matches[6])
else
	talisman.trade(matches[3], matches[4], (tonumber(matches[5]) or 1), matches[6])
end

