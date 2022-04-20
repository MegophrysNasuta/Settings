if IsTargetted(matches[2]) then
	if affstrack.score.preempt == 0 then
		affstrack.score.preempt = 100
		
		ak.scoreup(matches[2])
	end
end
