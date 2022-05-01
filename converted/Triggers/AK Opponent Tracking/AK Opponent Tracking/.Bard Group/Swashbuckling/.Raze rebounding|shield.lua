if IsTargetted(matches[2]) then
	if string.find(matches[1], "rebounding") then
		ak.defs.rebounding = false
	else
		ak.defs.shield = false
	end
	ak.scoreup(matches[2])
end
