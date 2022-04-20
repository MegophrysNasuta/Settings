if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   if affstrack.score.frozen > 200 then
      affstrack.score.frozen = 200
   end
end
