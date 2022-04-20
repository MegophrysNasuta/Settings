function ak.cure.active()
	ak.occie.aura.parsereduct("passive")
   if affstrack.score.voyria == 100 then
      affstrack.score.voyria = 0 
      return
   end
   affs = {}
   ak.randomaffs = ak.randomaffs or 0
   affoverone = {}
   affovertwo = {}
   affoverthree = {}
   affoverfour = {}
   affoverfive = {}
   affoversix = {}
   ocured = ocured or {}
   ocured.cureall = {}
   for i = 1, #affstrack.cureall do
      if affstrack.score[affstrack.cureall[i]] > 0  then
         table.insert(affs, affstrack.cureall[i])
         ocured.cureall[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]]
         if affstrack.score[affstrack.cureall[i]] > 100 and affstrack.cureall[i] == "aflame" then
            table.insert(affoverone, affstrack.cureall[i]) 
            affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
            if affstrack.score[affstrack.cureall[i]] > 100 then
               table.insert(affovertwo, affstrack.cureall[i]) 
               affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
               if affstrack.score[affstrack.cureall[i]] > 100 then
                  table.insert(affoverthree, affstrack.cureall[i]) 
                  affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
                  if affstrack.score[affstrack.cureall[i]] > 100 then
                     table.insert(affoverfour, affstrack.cureall[i]) 
                     affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
                     if affstrack.score[affstrack.cureall[i]] > 100 then
                        table.insert(affoverfive, affstrack.cureall[i]) 
                        affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
                        if affstrack.score[affstrack.cureall[i]] > 100 then
                           table.insert(affoversix, affstrack.cureall[i]) 
                           affstrack.score[affstrack.cureall[i]] = affstrack.score[affstrack.cureall[i]] - 100
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
         ocured.cureall[affs[i]] = affstrack.score[affs[i]]
         if affs[i] ~= "impatience" then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs-1)
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
   elseif #affs > 1 and table.contains(affs,"asthma") and SmokeCount() >= 100 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         ocured.cureall[affs[i]] = affstrack.score[affs[i]]
         if affs[i] ~= "asthma" then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / (#affs-1)
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
   elseif #affs > 0 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         ocured.cureall[affs[i]] = affstrack.score[affs[i]]
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
      ak.randomaffs = ak.randomaffs - 1
   else
      if ak.WhyYouDoThat then ak.WhyYouDoThat("cureall") end
   end
   ak.scoreup(target)
end
