--limbs misc
function ak.limbs.FindTargetHealth(who)
   if who == "Me" then
      return gmcp.Char.Vitals.maxhp
   end
   ak.knownmaxhealth = ak.knownmaxhealth or {}
   if table.contains(ak.knownmaxhealth, who) then
      return tonumber(ak.knownmaxhealth[who]) 
   else
      return 6000   
   end
end

function ak.limbs.ariaUp(name)
	if not ak.knownmaxhealth[name] then return end
	ak.knownmaxhealth[name] = ak.knownmaxhealth[name] * 1.1
end

function ak.limbs.ariaDown(name)
	display(name)
	if not ak.knownmaxhealth[name] then return end
	ak.knownmaxhealth[name] = ak.knownmaxhealth[name] / 1.1	
end

function ak.limbs.standardizeLimb(limb)
   local limbsc = {
   ["right leg"] = "rightleg",
   ["right arm"] = "rightarm",
   ["left arm"] = "leftarm",
   ["left leg"] = "leftleg",
   }
   if limbsc[limb] then
      return limbsc[limb]
   else
      return limb
   end
end

function ak.limbs.ExpoundLimb(limb)
   local limbs = {
   ["rightleg"] = "right leg",
   ["rightarm"] = "right arm",
   ["leftarm"] = "left arm",
   ["leftleg"] = "left leg",
   }
   if limbs[limb] then
      return limbs[limb]
   else
      return limb
   end
end

function ak.limbs.limb_table_check(who)
   ak.limbs.limbcount = ak.limbs.limbcount or {}
   who = who or "Me"
   if not ak.limbs.limbcount[who] then
      ak.limbs.limb_table_form(who)
   end
end

function ak.limbs.limb_table_form(who)
 ak.limbs.limbcount[who] = ak.limbs.limbcount[who] or {}
 ak.limbs.limbcount[who].lasthitdamage = ak.limbs.limbcount[who].lasthitdamage or {} 
 ak.limbs.limbcount[who].lasthitlimb = ak.limbs.limbcount[who].lasthitlimb or "rightleg"   
 ak.limbs.limbcount[who].breakpoint = ak.limbs.limbcount[who].breakpoint or 0
 ak.limbs.limbcount[who].rightarm = ak.limbs.limbcount[who].rightarm or 0 
 ak.limbs.limbcount[who].rightleg = ak.limbs.limbcount[who].rightleg or 0 
 ak.limbs.limbcount[who].leftarm = ak.limbs.limbcount[who].leftarm or 0 
 ak.limbs.limbcount[who].leftleg = ak.limbs.limbcount[who].leftleg or 0 
 ak.limbs.limbcount[who].torso = ak.limbs.limbcount[who].torso or 0 
 ak.limbs.limbcount[who].head = ak.limbs.limbcount[who].head or 0
 ak.limbs.limbcount[who].lastpercentrightarm = ak.limbs.limbcount[who].lastpercentrightarm or 0 
 ak.limbs.limbcount[who].lastpercentrightleg = ak.limbs.limbcount[who].lastpercentrightleg or 0 
 ak.limbs.limbcount[who].lastpercentleftarm = ak.limbs.limbcount[who].lastpercentleftarm or 0 
 ak.limbs.limbcount[who].lastpercentleftleg = ak.limbs.limbcount[who].lastpercentleftleg or 0 
 ak.limbs.limbcount[who].lastpercenttorso = ak.limbs.limbcount[who].lastpercenttorso or 0 
 ak.limbs.limbcount[who].lastpercenthead = ak.limbs.limbcount[who].lastpercenthead or 0
 ak.limbs.limbcount[who].maxbreaks = {}

 ak.limbs.limbcount[who].maxbreaks.rightarm = 0 
 ak.limbs.limbcount[who].maxbreaks.rightleg = 0 
 ak.limbs.limbcount[who].maxbreaks.leftarm = 0 
 ak.limbs.limbcount[who].maxbreaks.leftleg = 0 
 ak.limbs.limbcount[who].maxbreaks.torso = 0 
 ak.limbs.limbcount[who].maxbreaks.head = 0
end


function ak.limbs.limbreset(who)
 ak.limbs.limbcount[who] = ak.limbs.limbcount[who] or {}
 ak.limbs.limbcount[who].lasthitdamage = {} 
 ak.limbs.limbcount[who].lasthitlimb =  "rightleg"   
 ak.limbs.limbcount[who].breakpoint = 0
 ak.limbs.limbcount[who].rightarm = 0 
 ak.limbs.limbcount[who].rightleg = 0 
 ak.limbs.limbcount[who].leftarm = 0 
 ak.limbs.limbcount[who].leftleg = 0 
 ak.limbs.limbcount[who].torso = 0 
 ak.limbs.limbcount[who].head = 0
 ak.limbs.limbcount[who].lastpercentrightarm = 0 
 ak.limbs.limbcount[who].lastpercentrightleg = 0 
 ak.limbs.limbcount[who].lastpercentleftarm = 0 
 ak.limbs.limbcount[who].lastpercentleftleg = 0 
 ak.limbs.limbcount[who].lastpercenttorso = 0
 ak.limbs.limbcount[who].lastpercenthead = 0
 ak.limbs.limbcount[who].maxbreaks = {}
 ak.limbs.limbcount[who].maxbreaks.rightarm = 0 
 ak.limbs.limbcount[who].maxbreaks.rightleg = 0 
 ak.limbs.limbcount[who].maxbreaks.leftarm = 0 
 ak.limbs.limbcount[who].maxbreaks.leftleg = 0 
 ak.limbs.limbcount[who].maxbreaks.torso = 0 
 ak.limbs.limbcount[who].maxbreaks.head = 0
end

ak.limbs.BreakerOrder = {"rightleg","leftleg","head","torso","rightarm","leftarm"}
function ak.limbs.breakOrder(limb)
	table.remove(ak.limbs.BreakerOrder,table.index_of(ak.limbs.BreakerOrder,limb))
	table.insert(ak.limbs.BreakerOrder,limb)
end

function ak.limbs.FindLastBrokenLeg()
	local tick = false
	for i = 1, #ak.limbs.BreakerOrder do
		if ak.limbs.BreakerOrder[i] == "rightleg" or ak.limbs.BreakerOrder[i] == "leftleg" then
			if not tick then
				tick = true
			else
				return ak.limbs.BreakerOrder[i]
			end
		end
	end
end

