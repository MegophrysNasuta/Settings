if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   if affstrack.score.aflame < 200 then
      affstrack.score.aflame = 200
   end
   OppGainedAff("conflagrate")
end
