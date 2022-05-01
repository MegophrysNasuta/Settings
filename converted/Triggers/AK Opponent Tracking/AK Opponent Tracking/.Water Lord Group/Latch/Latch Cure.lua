if ak.ai() then return end
if IsTargetted(matches[2]) then
	affstrack.score.latched = 0
	ak.scoreup(matches[2])
end
