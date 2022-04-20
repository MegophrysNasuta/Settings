if ak.ai() then return end
if axkpunch1 then killTrigger(axkpunch1) end
if ak.monk.axkpunch then axkpunch1 = tempTrigger("You have recovered balance on your", [[ak.monk.axkpunch();killTrigger(axkpunch1)]]) end
table.insert(ak.limbs.currentbreak.weapon,"axk")
table.insert(ak.limbs.currentbreak.limb, "head")
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,"none")
enableTrigger("Parry locate")
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
disableTrigger("Monk Parry")


