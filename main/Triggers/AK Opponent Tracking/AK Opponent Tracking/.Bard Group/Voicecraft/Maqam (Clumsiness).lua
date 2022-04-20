ak.songoff = true
if IsTargetted(matches[2]) then
   if affstrack.score.clumsiness == 100 then
	    OppGainedAff("Dizziness")
   else
      OppGainedAff("Clumsiness")
   end
else
	ak.scoreup(matches[2])
end
