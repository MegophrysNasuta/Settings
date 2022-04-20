if IsTargetted(matches[2]) and not table.contains(ak.burstfucks,matches[2]) then 
	 if ak.ai() then return end
   if IsTargetted(lockedminds) then lockedminds = nil end
   weaponattack = {}
   if isActive("Confirmed Hit Limbs", "trigger") > 0 then
      ak.limbs.parseBreaks()
   end
   ak.oresetparse()
   ak.defs.sileris = false
   ak.defs.speed = false
   affstrack.score.deaf = 100
   affstrack.score.blind = 100
   ak.scoreup(matches[2])
end
ak.limbs.limbreset(matches[2])
