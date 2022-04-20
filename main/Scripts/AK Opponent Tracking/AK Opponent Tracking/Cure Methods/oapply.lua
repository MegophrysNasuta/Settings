function ak.cure.apply(what) 
	 if ak.timers.salvebackup then killTimer(ak.timers.salvebackup) end
   if aksalvechange then killTimer(aksalvechange) end
   if akrestoration then killTimer(akrestoration) end
   applycure = applycure or {} 
   if applycure.lastapplied then
      AKcalculateSalve()
   end
	 if what ~= "none" then
	 		ak.enemyprio.applied(what)
      ak.cure.lastapplied = what
      ak.randomaffs = ak.randomaffs or 0
      applycure = {}
      applycure.aknextsalve = false
      applycure.lastapplied = what
      applycure.affoverone = {}
      applycure.affovertwo = {}
      applycure.affoverthree = {}
      applycure.affoverfour = {}
      applycure.affoverfive = {}
      applycure.affoversix = {}
      applycure.donotrecount = {}
      applycure.possiblemendings = {}
      applycure.mendingscore = 0
      applycure.possiblerestorations = {}
      applycure.restorationscore = 0
      applycure.totalscore = 0
      applycure.both = {}
      applycure.otableadd = "applied"..what
      for i = 1, #affstrack.applied[what] do
         --display( affstrack.applied[what][i])--probable cures  
         --display(affstrack.score[affstrack.applied[what][i]])     
         if affstrack.score[affstrack.applied[what][i]] > 0 and affstrack.applied[what][i] ~= "frozen" and affstrack.applied[what][i] ~= "aflame" and (affstrack.score[affstrack.applied[what][i]] > 100 or affstrack.applied[what][i] == "head" or affstrack.applied[what][i] == "torso" or affstrack.applied[what][i] == "hypothermia") then
            table.insert(applycure.possiblerestorations, affstrack.applied[what][i])
            table.insert(applycure.both, affstrack.applied[what][i])
            table.insert(applycure.donotrecount, affstrack.applied[what][i]) 
						if affstrack.score[affstrack.applied[what][i]] < 200 then
							table.insert(applycure.possiblemendings, affstrack.applied[what][i]) 
							applycure.mendingscore = affstrack.score[affstrack.applied[what][i]] + applycure.mendingscore 
						end
            applycure.restorationscore = affstrack.score[affstrack.applied[what][i]] + applycure.restorationscore
            applycure.totalscore  =  affstrack.score[affstrack.applied[what][i]] + applycure.totalscore
            AKBackupSalveNumber(affstrack.applied[what][i])
         elseif affstrack.score[affstrack.applied[what][i]] > 100 and (affstrack.applied[what][i] == "frozen" or affstrack.applied[what][i] == "aflame") then
            table.insert(applycure.possiblemendings, affstrack.applied[what][i]) 
            table.insert(applycure.both, affstrack.applied[what][i])
            table.insert(applycure.donotrecount, affstrack.applied[what][i]) 
            applycure.mendingscore = affstrack.score[affstrack.applied[what][i]] + applycure.mendingscore  
            applycure.totalscore  =  affstrack.score[affstrack.applied[what][i]] + applycure.totalscore 
            AKBackupSalveNumber(affstrack.applied[what][i])
         elseif affstrack.score[affstrack.applied[what][i]] > 0 then
            table.insert(applycure.possiblemendings, affstrack.applied[what][i]) 
            table.insert(applycure.both, affstrack.applied[what][i])
            table.insert(applycure.donotrecount, affstrack.applied[what][i]) 
            applycure.mendingscore = affstrack.score[affstrack.applied[what][i]] + applycure.mendingscore  
            applycure.totalscore  =  affstrack.score[affstrack.applied[what][i]] + applycure.totalscore     
         end
      end
      for k,v in pairs(affstrack.applied) do
         for i=1, #affstrack.applied[k] do
            if not table.contains(applycure.donotrecount, affstrack.applied[k][i]) and affstrack.score[affstrack.applied[k][i]] > 0 then
							 applycure.totalscore  =  affstrack.score[affstrack.applied[k][i]] + applycure.totalscore 
            end
         end
      end
      applycure.totalscore = applycure.totalscore / 100
      applycure.mendingscore = applycure.mendingscore / 100
      applycure.restorationscore = applycure.restorationscore / 100
      if applycure.totalscore <= 1 and applycure.totalscore > 0 then --only one confirmed apply coming
         if #applycure.possiblemendings == 0 then
            applycure.aknextsalve = "restoration"
            if akrestoration then killTimer(akrestoration) end
            akrestoration = tempTimer(3.5,[[ak.cure.apply("none");affstrack.score.tempslickness = 0;ak.scoreup(target)]])
            affstrack.score.tempslickness = 100      
         elseif #applycure.possiblerestorations == 0 then
            applycure.aknextsalve = "mending"
            ak.cure.apply("none")
         else
            applycure.aknextsalve = "both"
            ak.cure.apply("none")
         end
      elseif applycure.totalscore > 0 then                          --MORE CURES COMING!
				 if ak.timers.salvebackup then killTimer(ak.timers.salvebackup) end
         ak.timers.salvebackup = tempTimer(5,[[ak.cure.salveBackup()]])
         if applycure.restorationscore > 0 and applycure.mendingscore > 0 then
            applycure.aknextsalve = "mending"
						if affstrack.score.crushedthroat == 100 and what == "head" then
							ak.cure.apply("none")
							return
						end
            if aksalvechange then killTimer(aksalvechange) end
            aksalvechange = tempTimer(2.5,[[
               if affstrack.score.slickness == 0 then
                  applycure.aknextsalve = "restoration"
               end
            ]])
         elseif applycure.restorationscore > 0 and applycure.mendingscore == 0 then	 
            applycure.aknextsalve = "restoration"
            affstrack.score.tempslickness = 100  
            if aksalvechange then killTimer(aksalvechange) end
         elseif applycure.restorationscore == 0 and applycure.mendingscore > 0 then
            applycure.aknextsalve = "mending"
            ak.cure.apply("none")
         end
		  elseif applycure.lastapplied == "body" and applycure.totalscore == 0 and affstrack.score.impatience == 100 then
				 if ak.thoughtIhad then ak.thoughtIhad("impatience") else affstrack.score.impatience = 0 end
				 affstrack.score.anorexia = 0 
      elseif applycure.lastapplied ~= "skin" then
         if ak.NoPreApply then

         elseif (gmcp.Char.Status.class ~= "Magi" or gmcp.Char.Status.race:match("Dragon")) then         
            applycure.aknextsalve = "restoration"
            if akrestoration then killTimer(akrestoration) end
            akrestoration = tempTimer(3.5,[[ak.cure.apply("none");affstrack.score.tempslickness = 0;ak.scoreup(target)]])
            affstrack.score.tempslickness = 100  
         end
			elseif applycure.lastapplied == "skin" then
				applycure.lastapplied = nil	 
      end
   else
      applycure = {}
      applycure.aknextsalve = nil
      applycure.lastapplied = nil
      applycure.affoverone = {}
      applycure.affovertwo = {}
      applycure.affoverthree = {}
      applycure.affoverfour = {}
      applycure.affoverfive = {}
      applycure.affoversix = {}
      applycure.donotrecount = {}
      applycure.possiblemendings = {}
      applycure.mendingscore = 0
      applycure.possiblerestorations = {}
      applycure.restorationscore = 0
      applycure.totalscore = 0
      applycure.both = {}
   end
   ak.scoreup(target)
end

function ak.cure.salveBackup()
	if affstrack.score.slickness == 0 then
		ak.cure.apply("none")
		cecho("\n<cyan>They are not applying salves. Forcing previous restoration cure through.\n")
	else
		if ak.timers.salvebackup then killTimer(ak.timers.salvebackup) end
    ak.timers.salvebackup = tempTimer(1,[[ak.cure.salveBackup()]])
	end
end


function AKcalculateSalve()
	 if ak.debug then 
	 	display("applycure")
		display(applycure)
	 end
   local affs = {}
   ak.cure.lastapplied = what
   ak.randomaffs = ak.randomaffs or 0
   applycure = applycure or {}
   applycure.aknextsalve = applycure.aknextsalve or "restoration"
   applycure.lastapplied = applycure.lastapplied or "torso"
   applycure.affoverone = {}
   applycure.affovertwo = {}
   applycure.affoverthree = {}
   applycure.affoverfour = {}
   applycure.affoverfive = {}
   applycure.affoversix = {}
   applycure.donotrecount = {}
   applycure.possiblemendings = {}
   applycure.mendingscore = 0
   applycure.possiblerestorations = {}
   applycure.restorationscore = 0
   applycure.totalscore = 0
   applycure.both = {}
   applycure.otableadd = "applied"..applycure.lastapplied
   ocured = ocured or {}
   ocured[applycure.otableadd] = {} 
   local ToBeCleared = {}
      for i = 1, #affstrack.applied[applycure.lastapplied] do
         --display( affstrack.applied[applycure.lastapplied][i])--probable cures         
         if affstrack.score[affstrack.applied[applycure.lastapplied][i]] > 0 and affstrack.applied[applycure.lastapplied][i] ~= "frozen" and affstrack.applied[applycure.lastapplied][i] ~= "aflame" and (affstrack.score[affstrack.applied[applycure.lastapplied][i]] > 100 or affstrack.applied[applycure.lastapplied][i] == "head" or affstrack.applied[applycure.lastapplied][i] == "torso" or affstrack.applied[applycure.lastapplied][i] == "hypothermia") then
            table.insert(ToBeCleared, affstrack.applied[applycure.lastapplied][i])
            table.insert(applycure.possiblerestorations, affstrack.applied[applycure.lastapplied][i])
            table.insert(applycure.both, affstrack.applied[applycure.lastapplied][i])
            table.insert(applycure.donotrecount, affstrack.applied[applycure.lastapplied][i]) 
            applycure.restorationscore = affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.restorationscore
            applycure.totalscore  =  affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.totalscore
            AKBackupSalveNumber(affstrack.applied[applycure.lastapplied][i])
         elseif affstrack.score[affstrack.applied[applycure.lastapplied][i]] > 100 and (affstrack.applied[applycure.lastapplied][i] == "frozen" or affstrack.applied[applycure.lastapplied][i] == "aflame") then                   
            table.insert(applycure.possiblemendings, affstrack.applied[applycure.lastapplied][i]) 
            table.insert(applycure.both, affstrack.applied[applycure.lastapplied][i])
            table.insert(applycure.donotrecount, affstrack.applied[applycure.lastapplied][i]) 
            applycure.mendingscore = affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.mendingscore  
            applycure.totalscore  =  affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.totalscore 
            AKBackupSalveNumber(affstrack.applied[applycure.lastapplied][i])
         elseif affstrack.score[affstrack.applied[applycure.lastapplied][i]] > 0 then
            table.insert(applycure.possiblemendings, affstrack.applied[applycure.lastapplied][i]) 
            table.insert(applycure.both, affstrack.applied[applycure.lastapplied][i])
            table.insert(applycure.donotrecount, affstrack.applied[applycure.lastapplied][i]) 
            applycure.mendingscore = affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.mendingscore  
            applycure.totalscore  =  affstrack.score[affstrack.applied[applycure.lastapplied][i]] + applycure.totalscore     
         end
      end
      applycure.totalscore = applycure.totalscore / 100
      applycure.mendingscore = applycure.mendingscore / 100
      applycure.restorationscore = applycure.restorationscore / 100
   if applycure.aknextsalve ~= "both" then
      if applycure.aknextsalve == "mending" and applycure.mendingscore > 0 then
         for i = 1, #applycure.possiblemendings do
            ocured[applycure.otableadd][applycure.possiblemendings[i]] = affstrack.score[applycure.possiblemendings[i]] 
            table.insert(affs, applycure.possiblemendings[i])
         end
      elseif applycure.aknextsalve == "restoration" and applycure.restorationscore > 0 then
         for i = 1, #applycure.possiblerestorations do
            ocured[applycure.otableadd][applycure.possiblerestorations[i]] = affstrack.score[applycure.possiblerestorations[i]] 
            table.insert(affs, applycure.possiblerestorations[i])
         end
      else
         applycure.aknextsalve = "both"
         for i = 1, #applycure.possiblerestorations do
            ocured[applycure.otableadd][applycure.possiblerestorations[i]] = affstrack.score[applycure.possiblerestorations[i]] 
            table.insert(affs, applycure.possiblerestorations[i])
          end
         for i = 1, #applycure.possiblemendings do
            ocured[applycure.otableadd][applycure.possiblemendings[i]] = affstrack.score[applycure.possiblemendings[i]] 
            table.insert(affs, applycure.possiblemendings[i])
         end
      end
   elseif applycure.aknextsalve == "both" then
      for i = 1, #applycure.possiblerestorations do
         ocured[applycure.otableadd][applycure.possiblerestorations[i]] = affstrack.score[applycure.possiblerestorations[i]] 
         table.insert(affs, applycure.possiblerestorations[i])
      end
      for i = 1, #applycure.possiblemendings do
         ocured[applycure.otableadd][applycure.possiblemendings[i]] = affstrack.score[applycure.possiblemendings[i]] 
         table.insert(affs, applycure.possiblemendings[i])
      end
   end
   --display(affs)
   --display(affstrack.score[affs[1]])
   if #affs == 1 and affstrack.score[affs[1]] < 100 then
      if #ToBeCleared > 0 then
         for i = 1, #ToBeCleared do
            ak.limbs.CountAgain(ToBeCleared[i])
         end
      end
      ocured[applycure.otableadd] = {}
      if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
      ocured[applycure.otableadd] = {}
      ocured[applycure.otableadd][affs[1]] = 100
   end
   if #affs > 0 then
      AKleftcuresfirst(affs)
      if #ToBeCleared > 0 then
         for i = 1, #ToBeCleared do
            ak.limbs.CountAgain(ToBeCleared[i])
         end
      end
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         reduceSalveAff(affs[i])
         affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs
         if affstrack.score[affs[i]] < ak.errorallowance then
            affstrack.score[affs[i]] = 0
						ak.AfflictionCured(affs[i])
         end
         if table.contains(applycure.affoverone, affs[i]) then
            affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
            if table.contains(applycure.affovertwo, affs[i]) then
               affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
               if table.contains(applycure.affoverthree, affs[i]) then
                  affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                  if table.contains(applycure.affoverfour, affs[i]) then
                     affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                     if table.contains(applycure.affoverfive, affs[i]) then
                        affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        if table.contains(applycure.affoversix, affs[i]) then
                           affstrack.score[affs[i]] = affstrack.score[affs[i]] + 100
                        end
                     end
                  end
               end
            end 
         end
      end
      if affstrack.score.aflame == 0 and affstrack.score.conflagrate == 100 then affstrack.score.conflagrate = 0;akadsty = 1 end
      if affstrack.score.hypothermia == 100 and affstrack.score.frozen == 0 then affstrack.score.hypothermia = 0 end
   elseif ak.randomaffs > 0 then
      ak.randomaffs = ak.randomaffs - 1
   else

   end
   applycure.lastapplied = nil
   affstrack.score.tempslickness = 0 
   ak.scoreup(target)
end



function AKBackupSalveNumber(aff)
   local resetcure = tonumber(affstrack.score[aff])
   if affstrack.score[aff] > 100 then
      table.insert(applycure.affoverone, aff) 
      affstrack.score[aff] = affstrack.score[aff] - 100
      if affstrack.score[aff] > 100 then
        table.insert(applycure.affovertwo, aff) 
        affstrack.score[aff] = affstrack.score[aff] - 100
        if affstrack.score[aff] > 100 then
           table.insert(applycure.affoverthree, aff) 
           affstrack.score[aff] = affstrack.score[aff] - 100
           if affstrack.score[aff] > 100 then
              table.insert(applycure.affoverfour, aff) 
              affstrack.score[aff] = affstrack.score[aff] - 100
              if affstrack.score[aff] > 100 then
                 table.insert(applycure.affoverfive, aff) 
                 affstrack.score[aff] = affstrack.score[aff] - 100
                 if affstrack.score[aff] > 100 then
                    table.insert(applycure.affoversix, aff) 
                    affstrack.score[aff] = affstrack.score[aff] - 100
                 end
              end
           end
        end
      end
   end
   affstrack.score[aff] = tonumber(resetcure)
end
function reduceSalveAff(aff)
   if affstrack.score[aff] > 100 then
      affstrack.score[aff] = affstrack.score[aff] - 100
      if affstrack.score[aff] > 100 then
        affstrack.score[aff] = affstrack.score[aff] - 100
        if affstrack.score[aff] > 100 then
           affstrack.score[aff] = affstrack.score[aff] - 100
           if affstrack.score[aff] > 100 then
              affstrack.score[aff] = affstrack.score[aff] - 100
              if affstrack.score[aff] > 100 then
                 affstrack.score[aff] = affstrack.score[aff] - 100
                 if affstrack.score[aff] > 100 then
                    affstrack.score[aff] = affstrack.score[aff] - 100
                 end
              end
           end
        end
      end
   end 
end

function AKleftcuresfirst(affs)
   if table.contains(affs,"rightleg") and table.contains(affs,"leftleg") then 
      for i=1, #affs do
         if affs[i] == "rightleg" then
            table.remove(affs,i)
         end
      end   
   elseif table.contains(affs,"rightarm") and table.contains(affs,"leftarm") then
      for i=1, #affs do
         if affs[i] == "rightarm" then
            table.remove(affs,i)
         end
      end 
   end
end
