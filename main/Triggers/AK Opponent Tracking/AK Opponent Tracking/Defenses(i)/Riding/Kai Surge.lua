if IsTargetted(matches[2]) then
	 if ak.ai() then return end
   EchoForMajorAff("PRONE")
   affstrack.score.surge = 100
   OppGainedAff("prone")
   ak.mounted = false
end
