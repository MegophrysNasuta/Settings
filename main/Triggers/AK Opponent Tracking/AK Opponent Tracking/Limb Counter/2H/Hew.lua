if matches[3] == "flesh" then 
   return 
end
if ak.ai() then return end
local augment = ak.limbs.twoh.stance["Me"] or "knight"
local weapon = matches[2]
local limb = ak.limbs.standardizeLimb(matches[3])
table.insert(ak.limbs.currentbreak.weapon,weapon)
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,augment)
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")
