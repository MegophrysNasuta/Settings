if not IsTargetted(matches[2]) then return end
if ak.ai() then return end
if ak.limbs.currentbreak.limb and #ak.limbs.currentbreak.limb > 0 and ak.limbs.currentbreak.who[#ak.limbs.currentbreak.who] == target then 
   targetparry = ak.limbs.currentbreak.limb[#ak.limbs.currentbreak.limb]
   cecho("<cyan>\n\n YOU HIT PARRY(<white>"..targetparry:title().."<cyan>)!!\n\n")
   cecho("<yellow>\n\n YOU HIT PARRY(<white>"..targetparry:title().."<yellow>)!!\n\n") 
end
