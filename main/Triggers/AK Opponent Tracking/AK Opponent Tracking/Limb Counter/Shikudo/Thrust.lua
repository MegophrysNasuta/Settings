if ak.ai() then return end
ak.limbs.ParseonLine()
if ak.shikudo.LimbBlock() then return end
local augment = "none"
local weapon = "thrust"
local limb = ak.limbs.standardizeLimb(matches[2])
table.insert(ak.limbs.currentbreak.weapon,weapon)
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,matches[3])
table.insert(ak.limbs.currentbreak.augment,"Shikudo")
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")

