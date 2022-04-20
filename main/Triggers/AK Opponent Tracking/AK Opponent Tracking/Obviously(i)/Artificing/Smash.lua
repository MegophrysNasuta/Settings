if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[4]) then
   smashlimb = matches[2]..matches[3]
   if affstrack.score[smashlimb] < 100 then
      OppGainedAff(smashlimb)
   end
end
