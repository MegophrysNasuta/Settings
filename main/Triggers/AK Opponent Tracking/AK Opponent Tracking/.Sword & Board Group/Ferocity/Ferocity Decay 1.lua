if ak.ai() then return end
affstrack.ferocity = affstrack.ferocity or 0
affstrack.ferocity = affstrack.ferocity - 1
if affstrack.ferocity < 0 then affstrack.ferocity = 0 end
ak.scoreup(target)
