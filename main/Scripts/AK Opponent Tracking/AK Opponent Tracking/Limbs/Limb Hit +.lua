--limbs2
ak.limbs = ak.limbs or {}
ak.limbs.test = ak.limbs.test or {}
ak.limbs.weaponry = ak.limbs.weaponry or {}
ak.limbs.parriedlimbs = ak.limbs.parriedlimbs or {}
ak.limbs.weaponry.magi = {"earthstaff","airstaff","firestaff","waterstaff"}
ak.limbs.currentbreak = ak.limbs.currentbreak or {}
ak.limbs.currentbreak.weapon = {}
ak.limbs.currentbreak.limb = {}
ak.limbs.currentbreak.attacker = {}
ak.limbs.currentbreak.augment = {}
ak.limbs.currentbreak.who = {}
ak.limbs.blademaster = ak.limbs.blademaster or {}
ak.limbs.blademaster.stance = ak.limbs.blademaster.stance or {}
ak.limbs.tekura = ak.limbs.tekura or {}
ak.limbs.shikudo = ak.limbs.shikudo or {}
ak.limbs.twoh = ak.limbs.twoh or {}
ak.limbs.twoh.stance = ak.limbs.twoh.stance or {}


ak.limbs.LimbHit = ak.limbs.LimbHit or function(who, attacker, weapon, limb, augment, check)
   if who == "Me" then return end
   local whomaxhealth = ak.limbs.FindTargetHealth(who)
   local damage = 0
   ak.limbs.limb_table_check(who)
   ak.limbs.deleteset = false
   ak.limbs.tekura.dontbreaksethead = false
   local attackerclass = "unknown"
   if attacker == "Me" and gmcp.Char.Status.race:match("Dragon") then
      attackerclass = "Dragon" 
   elseif attacker == "Me" and gmcp.Char.Status.class then
      attackerclass = gmcp.Char.Status.class
   elseif ndba and ndba.isperson(attacker) then
      attackerclass = ndba.names[attacker]["class"]
   end 
   if weapon == "tremolo" then 
      damage = 50
   elseif who == "Me" and wsys and wsys.stats.h == wsys.stats.oh then 
      if wsys.absorbed == false then
         return 
      end
   elseif weapon == "dragonrend" then 
      damage = 25
	 elseif weapon == "psion" then
	 	  damage = 25
	 elseif weapon == "wreathed" then
      damage = 12.5
   elseif weapon == "viridianrend" then
      damage = 25			
   elseif weapon == "airstaff" then --15,9 for magi
      if whomaxhealth > 5300 then
         damage = 10
      else
         damage = 11
      end  
      ak.staffaff(weapon)    
   elseif table.contains(ak.limbs.weaponry.magi, weapon) then
      if whomaxhealth > 5400 then
         damage = 16
      else
         damage = 17
      end   
      ak.staffaff(weapon)      
   elseif ak.limbs.myweapons and ak.limbs.myweapons[weapon] then --ak.limbs.myweapons
      damage = ak.limbs.findMyStab(weapon,whomaxhealth)
	 elseif ak.limbs.myformulas and ak.limbs.myformulas[weapon] then
	 		damage = ak.limbs.myformulas[weapon](who, attacker, weapon, limb, augment, check)
   else
      return
   end
   ak.limbs.limbcount[who]["lastpercent"..limb] = ak.limbs.limbcount[who][limb] + 0
   ak.limbs.limbcount[who][limb] = ak.limbs.limbcount[who][limb] + damage
   if weapon == "axk" then
      ak.limbs.tekura.dontbreaksethead = true
   end
   if target == who then
      ak.limbs.damageEcho_Target(target,limb)
   else
      ak.limbs.damageEcho_Non_Target(who,limb)
   end
   ak.limbs.test.currentmax = currentmax
   ak.limbs.test.damage = damage
   ak.limbs.test.who = who
   ak.limbs.test.whomaxhealth = whomaxhealth
   ak.limbs.test.attacker = attacker
   ak.limbs.test.attackerclass = attackerclass
   ak.limbs.test.weapon = weapon
   ak.limbs.test.limb = limb
   ak.limbs.test.augment = augment
   ak.limbs.test.check = check
end
