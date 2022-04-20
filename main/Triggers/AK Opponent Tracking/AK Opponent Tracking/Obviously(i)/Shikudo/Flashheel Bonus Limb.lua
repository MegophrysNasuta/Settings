if ak.ai() then return end
if not ak.limbs.shikudo.flashed then
  return
end
ak.limbs.ParseonLine()
local smashlimb = ak.limbs.shikudo.flashed.."leg"
if affstrack.score[smashlimb] < 100 then
   OppGainedAff(smashlimb)
end
ak.limbs.shikudo.flashed = false


