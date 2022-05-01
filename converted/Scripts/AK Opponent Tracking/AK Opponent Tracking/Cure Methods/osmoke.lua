ak.smoke = ak.smoke or {}

function affssmoke()
	ak.smoke.mass = {}
	ak.occie.aura.parsereduct("smoke")
   local affs = {}
   ocured = ocured or {}
   ak.randomaffs = ak.randomaffs or 0
   ocured.smoked = {}
   if affstrack.score.asthma>0 then 
      if ak.thoughtIhad then ak.thoughtIhad("asthma") else affstrack.score.asthma = 0 end
      ocured = ocured or {}
      ocured.smoked = {}
   end
   for i = 1, #affstrack.smoked do
      if affstrack.score[affstrack.smoked[i]] > 0 then
         table.insert(affs, affstrack.smoked[i])
      end
   end
   if #affs == 1 then
	 		if affstrack.score[affs[1]] < 100 and ak.randomaffs == 0 then
      	if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
      end
			ak.smoke.RetainMass(affs[1], affstrack.score[affs[1]])
			affstrack.score[affs[1]] = 0	
			ak.smoke.RestoreMass(affs[1])
			if affstrack.score[affs[1]] == 0 then
				 ak.AfflictionCured(affs[1])
				 ak.ResetConfirmAff(affs[1])
			end
   elseif #affs > 0 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         ocured.smoked[affs[i]] = affstrack.score[affs[i]]
				 ak.smoke.RetainMass(affs[1], affstrack.score[affs[1]])
         affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs
         if affstrack.score[affs[i]] < ak.errorallowance then
            affstrack.score[affs[i]] = 0
         end
				 ak.smoke.RestoreMass(affs[i])
				 if affstrack.score[affs[i]] == 0 then
				 	  ak.AfflictionCured(affs[i])
				 end
      end
   elseif ak.randomaffs > 0 then
      ak.randomaffs = ak.randomaffs - 1
   else
       reboundingaccountak = true
       if reboundingaktime then killTimer(reboundingaktime) end
       reboundingaktime = tempTimer(11,[[reboundingaccountak = false]])
   end
   ak.scoreup(target)
end

function ak.smoke.RetainMass(aff, count)
	ak.smoke.mass[aff] = roundDown(count-1,-2)
end

function ak.smoke.RestoreMass(aff)
	local returner = ak.smoke.mass[aff] or 0
	affstrack.score[aff] = affstrack.score[aff] + returner
end

