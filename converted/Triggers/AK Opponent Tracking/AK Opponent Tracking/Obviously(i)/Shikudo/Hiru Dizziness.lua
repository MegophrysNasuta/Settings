if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then 
	local aff = "dizziness"
	ak.AddedAffReset(aff)
	affstrack.score[aff] = 100
	ak.echogain(aff:title())
	ak.scoreup(matches[2])
end
