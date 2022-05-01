if ak.ai() then return end
local augment = "shattered"
ak.limbs.limb_table_check(matches[3])
local limb = ak.limbs.standardizeLimb(matches[2])
table.insert(ak.limbs.currentbreak.weapon,"shattered")
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,augment)
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")



