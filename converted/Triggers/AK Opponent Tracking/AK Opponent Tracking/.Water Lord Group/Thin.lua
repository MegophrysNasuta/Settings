if ak.ai() then return end
if IsTargetted(matches[2]) then
  if affstrack.score.haemophilia > 0 then
		ak.thoughtIhad("haemophilia") 
	end
	OppGainedAff("haemophilia")
	ak.pervasion.initialbleed = false
end
