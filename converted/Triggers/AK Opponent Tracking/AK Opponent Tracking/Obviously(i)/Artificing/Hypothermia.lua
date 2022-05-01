if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(multimatches[2][2]) then
   affstrack.score.frozen = 300
   affstrack.score.hypothermia = 100
   ak.scoreup(multimatches[2][2])
end
--affstrack.score.frozen = (affstrack.score.frozen * 2)-100
