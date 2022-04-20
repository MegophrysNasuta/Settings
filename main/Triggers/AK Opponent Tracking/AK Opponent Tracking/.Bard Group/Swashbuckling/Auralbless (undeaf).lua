if matches[2] == "yourself" then return false end

if IsTargetted(matches[2]) then
	affstrack.score.deaf = 100
end
