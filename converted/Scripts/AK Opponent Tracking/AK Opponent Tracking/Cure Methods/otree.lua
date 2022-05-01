function ak.cure.tree()
	 ak.occie.aura.parsereduct("treed")
   affs = {}
   ocured = ocured or {}
   ocured.treed = {}
   ak.randomaffs = ak.randomaffs or 0
   affoverone = {}
   affovertwo = {}
   affoverthree = {}
   affoverfour = {}
   affoverfive = {}
   affoversix = {}
   applycure = applycure or {}
   if ak.treeableSalve() and applycure.lastapplied and applycure.lastapplied ~= "head" and applycure.lastapplied ~= "torso" and applycure.aknextsalve ~= "mending" then
      --AKcalculateSalve()
   end
   affs = {}
   ocured = ocured or {}
   ocured.treed = {}
   ak.randomaffs = ak.randomaffs or 0
   affoverone = {}
   affovertwo = {}
   affoverthree = {}
   affoverfour = {}
   affoverfive = {}
   affoversix = {}
   if affstrack.score.paralysis > 0 then
      if ak.thoughtIhad then ak.thoughtIhad("paralysis") else affstrack.score.paralysis = 0 end
      ocured.bloodroot = {}
      ocured = ocured or {}
      ocured.treed = {}
   elseif affstrack.score.slickness > 0 then
     ocured.bloodroot = {}
   end
   for i = 1, #affstrack.treed do
      if affstrack.score[affstrack.treed[i]] > 0 and affstrack.score[affstrack.treed[i]] < 200 and affstrack.treed[i] ~= "aflame" and affstrack.treed[i] ~= "frozen" then
         table.insert(affs, affstrack.treed[i]) 
         ocured.treed[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]]     
         if affstrack.score[affstrack.treed[i]] > 100 then-- and affstrack.score[affstrack.treed[i]] ~= 200 then
            table.insert(affoverone, affstrack.treed[i]) 
            affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
         end
      elseif affstrack.score.hypothermia == 100 and affstrack.treed[i] == "frozen" then

      elseif affstrack.score[affstrack.treed[i]] > 0 and (affstrack.treed[i] == "aflame" or affstrack.treed[i] == "frozen") then
         table.insert(affs, affstrack.treed[i]) 
         ocured.treed[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]]
         if affstrack.score[affstrack.treed[i]] > 100 then
            table.insert(affoverone, affstrack.treed[i]) 
            affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
            if affstrack.score[affstrack.treed[i]] > 100 then
               table.insert(affovertwo, affstrack.treed[i]) 
               affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
               if affstrack.score[affstrack.treed[i]] > 100 then
                  table.insert(affoverthree, affstrack.treed[i]) 
                  affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
                  if affstrack.score[affstrack.treed[i]] > 100 then
                     table.insert(affoverfour, affstrack.treed[i]) 
                     affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
                     if affstrack.score[affstrack.treed[i]] > 100 then
                        table.insert(affoverfive, affstrack.treed[i]) 
                        affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
                        if affstrack.score[affstrack.treed[i]] > 100 then
                           table.insert(affoversix, affstrack.treed[i]) 
                           affstrack.score[affstrack.treed[i]] = affstrack.score[affstrack.treed[i]] - 100
                        end
                     end
                  end
               end
            end
         end
      end   
   end
   if #affs == 1 and affstrack.score[affs[1]] < 100 and ak.randomaffs == 0 then
      if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
      affstrack.score[affs[1]] = 0
			ak.AfflictionCured(affs[1])
			ak.ResetConfirmAff(affs[1])
   elseif #affs > 1 and table.contains(affs,"impatience") and FocusCount() >= 100 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         if affs[i] ~= "impatience" then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs -1)
            if affstrack.score[affs[i]] < ak.errorallowance then
               affstrack.score[affs[i]] = 0
							 ak.AfflictionCured(affs[i])
            end     
            if table.contains(affoverone, affs[i]) then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
               if table.contains(affovertwo, affs[i]) then
                  affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                  if table.contains(affoverthree, affs[i]) then
                     affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                     if table.contains(affoverfour, affs[i]) then
                        affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        if table.contains(affoverfive, affs[i]) then
                           affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                           if table.contains(affoversix, affs[i]) then
                              affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                           end
                        end
                     end
                  end
               end 
            end           
         end
      end  
      if affstrack.score.aflame == 0 and affstrack.score.conflagrate == 100 then affstrack.score.conflagrate = 0;akadsty = 1 end
   elseif #affs > 1 and table.contains(affs,"asthma") and SmokeCount() >= 100 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         if affs[i] ~= "asthma" then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs -1)
            if affstrack.score[affs[i]] < ak.errorallowance then
               affstrack.score[affs[i]] = 0
							 ak.AfflictionCured(affs[i])
            end     
            if table.contains(affoverone, affs[i]) then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
               if table.contains(affovertwo, affs[i]) then
                  affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                  if table.contains(affoverthree, affs[i]) then
                     affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                     if table.contains(affoverfour, affs[i]) then
                        affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        if table.contains(affoverfive, affs[i]) then
                           affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                           if table.contains(affoversix, affs[i]) then
                              affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                           end
                        end
                     end
                  end
               end 
            end           
         end
      end  
      if affstrack.score.aflame == 0 and affstrack.score.conflagrate == 100 then affstrack.score.conflagrate = 0;akadsty = 1 end
   elseif #affs > 0 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         --ocured.treed[affs[i]] = affstrack.score[affs[i]]                                       --move me
         affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs 
         if affstrack.score[affs[i]] < ak.errorallowance then
            affstrack.score[affs[i]] = 0
						ak.AfflictionCured(affs[i])
         end     
         if table.contains(affoverone, affs[i]) then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
            if table.contains(affovertwo, affs[i]) then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
               if table.contains(affoverthree, affs[i]) then
                  affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                  if table.contains(affoverfour, affs[i]) then
                     affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                     if table.contains(affoverfive, affs[i]) then
                        affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        if table.contains(affoversix, affs[i]) then
                           affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        end
                     end
                  end
               end
            end 
         end           
      end  
      if affstrack.score.aflame == 0 and affstrack.score.conflagrate == 100 then affstrack.score.conflagrate = 0;akadsty = 1 end
   elseif ak.randomaffs > 0 then
      AKcalculateSalve()
      ak.randomaffs = ak.randomaffs - 1
   else
      if ak.WhyYouDoThat then ak.WhyYouDoThat("treed") end
   end
   ak.scoreup(target)
end

local LimbsToCheck = {"rightleg","leftleg","rightarm","leftarm"}

function ak.treeableSalve()
	if affstrack.score.aflame > 0 then
		return true
	end
	for i = 1, #LimbsToCheck do
		if affstrack.score[LimbsToCheck[i]] > 0 and affstrack.score[LimbsToCheck[i]] <= 100 then
			return true
		elseif affstrack.score[LimbsToCheck[i]] > 100 and affstrack.score[LimbsToCheck[i]] <= 200 and applycure.lastapplied ~= "torso" and applycure.lastapplied ~= "head" and applycure.aknextsalve ~= "mending" then
			return true
		end
	end

	return false

end
