if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
	if ak.kata >= 11 then
		OppGainedAff("lethargy, weariness")
	elseif affstrack.score.weariness<100 then 
		local aff = "weariness"
		ak.AddedAffReset(aff)
		affstrack.score[aff] = 100
		ak.echogain(aff:title())
		ak.scoreup(matches[2])
	else
		local aff = "lethargy"
		ak.AddedAffReset(aff)
		affstrack.score[aff] = 100
		ak.echogain(aff:title())
		ak.scoreup(matches[2])
	end
end
