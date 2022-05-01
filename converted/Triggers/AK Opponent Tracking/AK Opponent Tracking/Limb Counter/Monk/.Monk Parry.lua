if ak.ai() then return end
ak.limbs.parriedlimbs = ak.limbs.parriedlimbs or {}
if not IsTargetted(matches[2]) then return end
if #ak.limbs.parriedlimbs == 0 then return end
targetparry = ak.limbs.parriedlimbs[1]
cecho("<cyan>\n\n YOU HIT PARRY(<white>"..targetparry:title().."<cyan>)!!\n\n")
cecho("<yellow>\n\n YOU HIT PARRY(<white>"..targetparry:title().."<yellow>)!!\n\n")
disableTrigger("Parry locate") 
disableTrigger("Monk Parry")
ak.scoreup(matches[2])
