tunesmithing = "none"
if ak.ai() then return end
--ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   local smashlimb = ak.limbs.standardizeLimb(matches[3])
   if affstrack.score[smashlimb] < 100 then
      OppGainedAff(smashlimb)
   end
end
