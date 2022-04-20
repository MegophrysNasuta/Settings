if IsTargetted(matches[2]) then
	ak.currentmana = ak.currentmana + (ak.maxmana*.08)
	if ak.currentmana > tonumber(ak.maxmana) then
		ak.currentmana = ak.maxmana
	end
	ak.scoreup(target)
end
