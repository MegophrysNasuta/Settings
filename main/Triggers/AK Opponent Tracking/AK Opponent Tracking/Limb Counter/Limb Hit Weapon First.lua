if ak.ai() then return end
if matches[3] == "flesh" then 
   return 
end
local augment = "none"
local weapon = matches[2]
if weapon == "claws" then
   augment = "percent"
   weapon = "dragonrend"
elseif weapon == "maul" then
   augment = "percent"
   weapon = "maul"
elseif weapon == "vines" then
	if affstrack.vinewreathe then
   weapon = "wreathed"
	else
   weapon = "viridianrend"
	end
end
local limb = ak.limbs.standardizeLimb(matches[3])
table.insert(ak.limbs.currentbreak.weapon,weapon)
table.insert(ak.limbs.currentbreak.limb,limb)
table.insert(ak.limbs.currentbreak.attacker,"Me")
table.insert(ak.limbs.currentbreak.who,target)
table.insert(ak.limbs.currentbreak.augment,augment)
enableTrigger("Missed Single Removal Limbs")          
enableTrigger("Confirmed Hit Limbs")
enableTrigger("Parry locate")
