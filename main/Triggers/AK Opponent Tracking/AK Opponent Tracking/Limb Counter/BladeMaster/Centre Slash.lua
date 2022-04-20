if ak.ai() then return end
local augment = "none"
local limb = ak.limbs.standardizeLimb(matches[3])
table.insert(ak.limbs.currentbreak.weapon,"centreslash")
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,"blademaster")
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")
