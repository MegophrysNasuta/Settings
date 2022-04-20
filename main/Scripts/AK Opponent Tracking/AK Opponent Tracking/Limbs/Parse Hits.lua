-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.limbs.ParseonLine()
	if isActive("Confirmed Hit Limbs", "trigger") == 0 then return end
	ak.limbs.parseBreaks()
end



function ak.limbs.parseBreaks()
   cecho("<cyan>.")
   ak.limbs.ScoreRun = false
   disableTrigger("Missed Single Removal Limbs")                --DO NOT CHANGE!
   disableTrigger("Parry locate")
   disableTrigger("Monk Parry")
   local augment = "none"
   if #ak.limbs.currentbreak.weapon > 0 then
      for i = 1, #ak.limbs.currentbreak.weapon do
         if ak.limbs.currentbreak.augment[i] then
            augment = ak.limbs.currentbreak.augment[i] 
         else
            augment = "none"
         end
         ak.limbs.LimbHit(ak.limbs.currentbreak.who[i], ak.limbs.currentbreak.attacker[i], ak.limbs.currentbreak.weapon[i], ak.limbs.currentbreak.limb[i], augment)
      end
   end
   ak.limbs.currentbreak.weapon = {}
   ak.limbs.currentbreak.limb = {}
   ak.limbs.currentbreak.attacker = {}
   ak.limbs.currentbreak.who = {}
   ak.limbs.currentbreak.augment = {}
   cecho("<cyan>.")
   ak.limbs.absorbed = false
end

function ak.limbs.parseBreaksPrompt()
   cecho("<cyan>.")
   ak.limbs.ScoreRun = true
   disableTrigger("Missed Single Removal Limbs")                --DO NOT CHANGE!
   disableTrigger("Confirmed Hit Limbs") 
   disableTrigger("Parry locate")
   disableTrigger("Monk Parry")
   local augment = "none"
   if #ak.limbs.currentbreak.weapon > 0 then
      for i = 1, #ak.limbs.currentbreak.weapon do
         if ak.limbs.currentbreak.augment[i] then
            augment = ak.limbs.currentbreak.augment[i] 
         else
            augment = "none"
         end
         ak.limbs.LimbHit(ak.limbs.currentbreak.who[i], ak.limbs.currentbreak.attacker[i], ak.limbs.currentbreak.weapon[i], ak.limbs.currentbreak.limb[i], augment)
      end
   else
      ak.scoreup(target)
   end
   ak.limbs.currentbreak.weapon = {}
   ak.limbs.currentbreak.limb = {}
   ak.limbs.currentbreak.attacker = {}
   ak.limbs.currentbreak.who = {}
   ak.limbs.currentbreak.augment = {}
   cecho("<pink>*")
   ak.limbs.absorbed = false
end
