if ak.ai() then return end
--ak.limbs.ParseonLine()
if IsTargetted(matches[2]) and affstrack.score.paralysis < 100 then 
  OppGainedAff("paralysis")
end
