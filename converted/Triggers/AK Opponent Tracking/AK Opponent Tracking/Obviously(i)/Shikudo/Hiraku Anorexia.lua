if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then 
	local aff = "anorexia"
	ak.AddedAffReset(aff)
	ak.AddedAffReset("stuttering")
	affstrack.score[aff] = 100
	affstrack.score["stuttering"] = 100
	ak.echogain("anorexia, stuttering")
	ak.scoreup(matches[2])
end
