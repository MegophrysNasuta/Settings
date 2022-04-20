if IsTargetted(multimatches[2][3]) then
	if multimatches[2][2] == "legs" then
		affstrack.score.rightleg = 300
		affstrack.score.leftleg = 300
		ak.twoh.tendons = 0
		ak.tendonHit()
		ak.scoreup(multimatches[2][3])
	elseif multimatches[2][2] == "arms" then
		affstrack.score.rightarm = 300
		affstrack.score.leftarm = 300
		ak.twoh.wrist = 0
		ak.wristHit()
		ak.scoreup(multimatches[2][3])
	end
end
