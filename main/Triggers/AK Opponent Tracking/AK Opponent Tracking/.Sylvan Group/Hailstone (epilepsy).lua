if IsTargetted(matches[2]) then
	if affstrack.score.clumsiness < 100 and affstrack.score.clumsiness > 0 then
      if ak.ProTrackingConfirmed then 
         ak.ProTrackingConfirmed("clumsiness") 
      else 
         affstrack.score.clumsiness = 100
         ak.scoreup(matches[2])
      end
	end
	affstrack.score.clumsiness = 100
	OppGainedAff("epilepsy")
	if affstrack.overcharge == true then
		OppGainedAff("weariness")
	end
end


