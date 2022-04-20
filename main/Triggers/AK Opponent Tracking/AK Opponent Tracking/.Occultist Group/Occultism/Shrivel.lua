if ak.ai() then return end
if IsTargetted(matches[2]) then
   smashlimb = matches[3]..matches[4]
   if affstrack.score[smashlimb] < 100 then
      OppGainedAff(smashlimb)
   end
end
