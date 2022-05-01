if IsTargetted(matches[3]) then
   OppGainedAff("Prone")
   local smashlimb = matches[2].."leg"
   if affstrack.score[smashlimb] < 200 then
      affstrack.score[smashlimb] = 200
   end
end
