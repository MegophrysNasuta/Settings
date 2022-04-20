if ak.ai() then return end
ak.defs.shield = false
if matches[2] == "Sllshya" then
   table.insert(ak.limbs.currentbreak.weapon, "waterstaff")
elseif matches[2] == "Garash" then
   table.insert(ak.limbs.currentbreak.weapon, "earthstaff")
elseif matches[2] == "Kkractle" then
   table.insert(ak.limbs.currentbreak.weapon, "firestaff")
elseif matches[2] == "Whiirh" then
   table.insert(ak.limbs.currentbreak.weapon, "airstaff")
end
local limb = ak.limbs.standardizeLimb(matches[4])
table.insert(ak.limbs.currentbreak.limb, limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,matches[3])
enableTrigger("Missed Single Removal Limbs")
enableTrigger("Parry locate")          
enableTrigger("Confirmed Hit Limbs")





