function ak.cure.ate(what,prorun)
	ak.occie.aura.parsereduct(what)
   local affs = {}
   ak.nexteatcheck(what)
   ak.mickey = false
   ak.randomaffs = ak.randomaffs or 0
   ocured = ocured or {}
   ocured.conversion[what] = ocured.conversion[what] or "notadded"
   ocured[ocured.conversion[what]] = {}
	 ak.eatsbetweenaffs = ak.eatsbetweenaffs + 1
   local affconfirmedcount = 0
   if affstrack.score.anorexia>0 and not prorun then 
      if ak.thoughtIhad then ak.thoughtIhad("anorexia") else affstrack.score.anorexia = 0 end
      ocured = ocured or {}
      ocured[ocured.conversion[what]] = {}
   end
   if what == "hawthorn berry" or what == "calamine crystal" then
      affstrack.score.deaf = 100
      tempTimer(3,[[affstrack.score.deaf = 0;ak.scoreup(target)]])
   else
      for i = 1, #affstrack.eaten[what] do
         if affstrack.score[affstrack.eaten[what][i]] > 0 then
            table.insert(affs, affstrack.eaten[what][i])
            affconfirmedcount = affconfirmedcount + affstrack.score[affstrack.eaten[what][i]]
         end
      end
      if #affs == 1 and affstrack.score[affs[1]] < 100 and ak.randomaffs == 0 then
         if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
         affstrack.score[affs[1]] = 0
				 ak.AfflictionCured(affs[1])
				 ak.ResetConfirmAff(affs[1])
      elseif #affs > 1 and affconfirmedcount <= 100 then
			   if #affs and table.contains(affs,"slickness") and affstrack.score.asthma == 100 then
				    ak.echoForPossibleCures(table.concat(affs, " ")) 
						--if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
				 else
         	  if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
				 end
         for i = 1, #affs do
            affstrack.score[affs[i]] = 0
						ak.AfflictionCured(affs[i])
         end
      elseif #affs > 1 and table.contains(affs,"impatience") and ak.goldensealCount() > 100 then
         ak.echoForPossibleCures(table.concat(affs, " "))
         for i = 1, #affs do            
            ocured = ocured or {}
            ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
            ocured[ocured.conversion[what]][affs[i]] = affstrack.score[affs[i]]
            if affs[i] ~= "impatience" then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs-1)
            end
            if affstrack.score[affs[i]] < ak.errorallowance then
                affstrack.score[affs[i]] = 0
								ak.AfflictionCured(affs[i])
            end
         end
      elseif #affs > 1 and table.contains(affs,"asthma") and SmokeCount() >= 100 then
         ak.echoForPossibleCures(table.concat(affs, " "))
         for i = 1, #affs do            
            ocured = ocured or {}
            ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
            ocured[ocured.conversion[what]][affs[i]] = affstrack.score[affs[i]]
            if affs[i] ~= "asthma" then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs-1)
            end
            if affstrack.score[affs[i]] < ak.errorallowance then
                affstrack.score[affs[i]] = 0
								ak.AfflictionCured(affs[i])
            end
         end
			
			elseif #affs > 1 and table.contains(affs,"slickness") and affstrack.score.prone == 100 and ak.canstand() then
         ak.echoForPossibleCures(table.concat(affs, " "))
         for i = 1, #affs do            
            ocured = ocured or {}
            ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
            ocured[ocured.conversion[what]][affs[i]] = affstrack.score[affs[i]]
            if affs[i] ~= "paralysis" then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs-1)
            end
            if affstrack.score[affs[i]] < ak.errorallowance then
                affstrack.score[affs[i]] = 0
								ak.AfflictionCured(affs[i])
            end
         end
				 
		  elseif #affs == 1 and table.contains(affs,"slickness") and affstrack.score.asthma > 0 and affstrack.score.asthma < 100 then
         ak.echoForPossibleCures(table.concat(affs, " "))
         for i = 1, #affs do            
            ocured = ocured or {}
            ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
            ocured[ocured.conversion[what]][affs[i]] = affstrack.score[affs[i]]
            if affstrack.score[affs[i]] < ak.errorallowance then
                affstrack.score[affs[i]] = 0
								ak.AfflictionCured(affs[i])
            end
						ak.ProTrackingConfirmed("asthma")
						ak.ResetConfirmAff(affs[i])
         end
		 elseif #affs == 1 then
         ak.echoForPossibleCures(table.concat(affs, " "))
         ocured = ocured or {}
         ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
         ocured[ocured.conversion[what]][affs[1]] = affstrack.score[affs[1]]
         affstrack.score[affs[1]] = affstrack.score[affs[1]] - affstrack.score[affs[1]] / #affs
         if affstrack.score[affs[1]] < ak.errorallowance then
             affstrack.score[affs[1]] = 0
					ak.AfflictionCured(affs[1])
         end
			   ak.ResetConfirmAff(affs[1])
      elseif #affs > 0 then
         ak.echoForPossibleCures(table.concat(affs, " "))
         for i = 1, #affs do
            ocured = ocured or {}
            ocured[ocured.conversion[what]] = ocured[ocured.conversion[what]] or {}
            ocured[ocured.conversion[what]][affs[i]] = affstrack.score[affs[i]]
            affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs
            if affstrack.score[affs[i]] < ak.errorallowance then
                affstrack.score[affs[i]] = 0
								ak.AfflictionCured(affs[i])
            end
         end
      elseif ak.randomaffs > 0 then
         ak.randomaffs = ak.randomaffs - 1
      else
         if ak.WhyYouDoThat then ak.WhyYouDoThat(what) end
      end
   end
   ak.scoreup(target)
end

function ak.goldensealCount()
	local count = 0
	for i = 1, #affstrack.eaten["goldenseal root"] do
     if affstrack.score[affstrack.eaten["goldenseal root"][i]] > 0 then
        count = count + affstrack.score[affstrack.eaten["goldenseal root"][i]]
     end
  end
	return count
end

function FocusCount()
  local count = 0
  for i = 1, #affstrack.focused do
      if affstrack.score[affstrack.focused[i]] > 0 then
         count = count + affstrack.score[affstrack.focused[i]]
      end
   end
   return count
end

function SmokeCount()
   local count = 0
   if affstrack.score.aeon > 0 then return 0 end
   for i = 1, #affstrack.smoked do
      if affstrack.score[affstrack.smoked[i]] > 0 then
         count = count + affstrack.score[affstrack.smoked[i]]
      end
   end
   return count
end

if not ak.nexteatcheck then
   function ak.nexteatcheck(what)
		ak.lasteat = what
   end
end

function ak.canstand()
	if affstrack.score.rightleg == 0 and affstrack.score.leftleg == 0 then
		return true
	else
		return false
	end
end
