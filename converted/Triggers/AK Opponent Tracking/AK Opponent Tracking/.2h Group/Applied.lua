if IsTargetted(matches[2]) then
	if gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] and gmcp.Char.Vitals.charstats[3] == "Spec: Two Handed" then			
		send("battlefury perceive "..target)
	end
	--if ak.twoh[ak.twoh.salveconversion[matches[3]]] > 5 then
		--ak.twoh[ak.twoh.salveconversion[matches[3]]] = ak.twoh[ak.twoh.salveconversion[matches[3]]] - 2
		--cecho("<yellow>"..ak.twoh.salveconversion[matches[3]]..":<cyan> "..ak.twoh[ak.twoh.salveconversion[matches[3]]])
	--else
		ak.twoh[ak.twoh.salveconversion[matches[3]]] = ak.twoh[ak.twoh.salveconversion[matches[3]]] - 1
		if ak.twoh[ak.twoh.salveconversion[matches[3]]] < 0 then ak.twoh[ak.twoh.salveconversion[matches[3]]] = 0 end
		cecho("<yellow>"..ak.twoh.salveconversion[matches[3]]..":<cyan> "..ak.twoh[ak.twoh.salveconversion[matches[3]]])
	--end
	if matches[3] == "legs" then
		ak.tendonHit()
	elseif matches[3] == "arms" then
		ak.wristHit()
	elseif matches[3] == "head" then
		ak.skullHit()
	elseif matches[3] == "torso" then
		ak.ribHit()
	end
	ak.scoreup(matches[2])
end
--legs,arms,head,torso
