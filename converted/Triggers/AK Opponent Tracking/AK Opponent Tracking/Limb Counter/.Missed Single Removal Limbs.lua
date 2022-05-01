if string.findPattern(matches[1],"rebounds") then
   ak.limbs.blademaster.rebound = true
   ak.limbs.currentbreak.who[#ak.limbs.currentbreak.who] = ak.limbs.currentbreak.attacker[#ak.limbs.currentbreak.attacker]
elseif #ak.limbs.currentbreak.who > 0 then
   table.remove(ak.limbs.currentbreak.weapon, #ak.limbs.currentbreak.who)
   table.remove(ak.limbs.currentbreak.limb, #ak.limbs.currentbreak.who)
   table.remove(ak.limbs.currentbreak.attacker,#ak.limbs.currentbreak.who)
   if #ak.limbs.currentbreak.augment == #ak.limbs.currentbreak.who then
      table.remove(ak.limbs.currentbreak.augment,#ak.limbs.currentbreak.who)
   end
   table.remove(ak.limbs.currentbreak.who,#ak.limbs.currentbreak.who)
end


