if ak.ai() then return end
table.insert(ak.limbs.currentbreak.weapon,"sdk")
table.insert(ak.limbs.currentbreak.limb, "torso")
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,"none")
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")
disableTrigger("Monk Parry")



