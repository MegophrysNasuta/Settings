if ak.ai() then return end
--ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
	if ak.kata and ak.kata >= 9 then
		OppGainedAff("clumsiness, healthleech")
	elseif affstrack.score.clumsiness <100 then 
		local aff = "clumsiness"
		ak.AddedAffReset(aff)
		affstrack.score[aff] = 100
		ak.echogain(aff:title())
		ak.scoreup(matches[2])
	else 
	  local aff = "healthleech"
		ak.AddedAffReset(aff)
		affstrack.score[aff] = 100
		ak.echogain(aff:title())
		ak.scoreup(matches[2])
	end
end

--if kata > 8 ruku gives both
