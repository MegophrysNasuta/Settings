if ak.ai() then return
else
return
end
local weapon = matches[4]
local limb = ak.limbs.standardizeLimb(matches[3])
table.insert(ak.limbs.currentbreak.weapon,weapon)
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,matches[2])
table.insert(ak.limbs.currentbreak.augment,"sentinel")
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")
