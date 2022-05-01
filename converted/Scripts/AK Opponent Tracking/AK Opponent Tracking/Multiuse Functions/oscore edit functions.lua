--OppGainedAff

function OppGainedAff(aff)
	if not aff then return end
	local affStr = {}
	aff = aff:lower()
  if string.find(aff," ") then                          --Multi Venoms
	 		ak.eatsbetweenaffs = 0
      for word in string.gmatch(aff, "%a+") do
         if (word == "sensitivity" or word == "prefarar") and affstrack.score.deaf == 0 then 
            word = "deaf" 
         end
         if table.contains(affstrack.mentallist, word) then
            ak.occie.aura.mental = ak.occie.aura.mental + 1 
         end
         if table.contains(affstrack.physicallist, word) then
            ak.occie.aura.physical = ak.occie.aura.physical + 1 
         end
				 if word == "amnesia" then
				    affstrack.score.amnesia = 100
				    if amnesiatimer then 
							killTimer(amnesiatimer)
							amnesiatimer = nil 
						end
            amnesiatimer = tempTimer(1, [[OppLostAff("amnesia")]])
         elseif string.find(word,"unweave") then
            affstrack.score[word] = affstrack.score[word] + 100
            table.insert(affStr,word:title())
         elseif word == "wrenchhead" then
            affstrack.score.wrenchhead = 100
            OppGainedAff("dizziness")
            disableTimer("Wrench Head Timer")
            enableTimer("Wrench Head Timer")
            ak.HeadWrenchDisable = tempTimer(24,[[affstrack.score.wrenchhead = 0;ak.scoreup(target)]])
            ak.InitialWrench = tempTimer(3.5,[[OppGainedAff("dizziness")]])
            table.insert(affStr,word:title())
				 elseif word == "armexpend" then
            affstrack.score.armexpend = 100
            ak.armexpendtimer = tempTimer(8,[[affstrack.score.armexpend = 0;ak.scoreup(target)]])
            table.insert(affStr,word:title())	
				 elseif word == "blisters" then
            affstrack.score.blisters = 100
            ak.blisterkiller = tempTimer(20,[[affstrack.score.blisters = 0;ak.scoreup(target)]])
            table.insert(affStr,word:title())	
				 elseif word == "hamstring" then
            affstrack.score.hamstring = 100
            ak.hamstringtimer = tempTimer(9.5,[[affstrack.score.hamstring = 0;ak.scoreup(target)]])
            table.insert(affStr,word:title())         
				 elseif word == "worm" then
            affstrack.score.worm = 100
            ak.wormtimer = tempTimer(20,[[affstrack.score.worm = 0;ak.scoreup(target)]])
            table.insert(affStr,word:title())	                      				 
         elseif word == "wrenchtorso" then
            affstrack.score.wrenchtorso = 100
            ak.TorsoWrenchDisable = tempTimer(24,[[affstrack.score.wrenchtorso = 0;ak.scoreup(target)]])
            table.insert(affStr,word:title())
         elseif word == "epseth" or word == "crippledleg" then
            if affstrack.score["leftleg"] < 100 then       
               affstrack.score["leftleg"] = 100
               ak.AddedAffReset("leftleg") 
						table.insert(affStr,word:title())
            elseif affstrack.score["rightleg"] < 100 then       
               affstrack.score["rightleg"] = 100
               ak.AddedAffReset("rightleg") 
						table.insert(affStr,word:title())
            end
         elseif word == "epteth" or word == "crippledarm" then
            if affstrack.score["leftarm"] < 100 then       
               affstrack.score["leftarm"] = 100
               ak.AddedAffReset("leftarm") 
						table.insert(affStr,word:title())
            elseif affstrack.score["rightarm"] < 100 then       
               affstrack.score["rightarm"] = 100
               ak.AddedAffReset("rightarm") 
						table.insert(affStr,word:title())
            end						
				 elseif word == "frozen" then
            affstrack.score[word] = affstrack.score[word] + 100 
            table.insert(affStr,aff:title()) 
            if affstrack.score.frozen > 300 then
               affstrack.score.frozen = 300
            end							
				 elseif word == "deepfreeze" then
            affstrack.score["frozen"] = affstrack.score["frozen"] + 200 
            table.insert(affStr,"Frozen") 
            if affstrack.score.frozen > 300 then
               affstrack.score.frozen = 300
            end										
         elseif affstrack.score[word] then
            if affstrack.score[word] < 100 then       
               affstrack.score[word] = 100
               ak.AddedAffReset(word)
               if (word == "deaf" or word == "sensitivity") then 
                  word = "prefarar" 
               end   
               table.insert(affStr,word:title())
            end
         elseif affstrack.venoms[word] then 
            if affstrack.score[affstrack.venoms[word]] < 100 then    
               affstrack.score[affstrack.venoms[word]] = 100
               ak.AddedAffReset(affstrack.venoms[word])
               if (word == "deaf" or word == "sensitivity") then 
                  word = "prefarar" 
               end
               table.insert(affStr,affstrack.venoms[word]:title())  
            end
         end
		  end
	else          --Single venom
		 ak.eatsbetweenaffs = 1
     if (aff == "sensitivity" or aff == "prefarar") and affstrack.score.deaf == 0 then 
        aff = "deaf" 
     end  
     if table.contains(affstrack.mentallist, aff) then
        ak.occie.aura.mental = ak.occie.aura.mental + 1 
     end
     if table.contains(affstrack.physicallist, aff) then
        ak.occie.aura.physical = ak.occie.aura.physical + 1 
     end
		 if aff == "amnesia" then
				affstrack.score.amnesia = 100
				if amnesiatimer then 
				   killTimer(amnesiatimer)
				   amnesiatimer = nil 
				end
        amnesiatimer = tempTimer(1, [[OppLostAff("amnesia")]])
     elseif string.find(aff,"unweave") then
        affstrack.score[aff] = affstrack.score[aff] + 100
        table.insert(affStr,aff:title())
     elseif aff == "wrenchhead" then
        affstrack.score.wrenchhead = 100
        affstrack.score.torso = 100
        OppGainedAff("dizziness")
        disableTimer("Wrench Head Timer")
        enableTimer("Wrench Head Timer")
        ak.HeadWrenchDisable = tempTimer(24,[[affstrack.score.wrenchhead = 0;ak.scoreup(target)]])
        ak.InitialWrench = tempTimer(3.5,[[OppGainedAff("dizziness")]])
        table.insert(affStr,aff:title())			
		 elseif aff == "blisters" then
        affstrack.score.blisters = 100
        ak.blisterkiller = tempTimer(20,[[affstrack.score.blisters = 0;ak.scoreup(target)]])
        table.insert(affStr,aff:title())	
     elseif aff == "wrenchtorso" then
        affstrack.score.wrenchtorso = 100
        ak.TorsoWrenchDisable = tempTimer(24,[[affstrack.score.wrenchtorso = 0;ak.scoreup(target)]])
        table.insert(affStr,aff:title())
		 elseif aff == "armexpend" then
        affstrack.score.armexpend = 100
        ak.TorsoWrenchDisable = tempTimer(8,[[affstrack.score.armexpend = 0;ak.scoreup(target)]])
        table.insert(affStr,aff:title())	
		 elseif aff == "hamstring" then
         affstrack.score.hamstring = 100
         ak.TorsoWrenchDisable = tempTimer(9.5,[[affstrack.score.hamstring = 0;ak.scoreup(target)]])
         table.insert(affStr,aff:title())	
		 elseif aff == "worm" then
          affstrack.score.worm = 100
          ak.wormtimer = tempTimer(20,[[affstrack.score.worm = 0;ak.scoreup(target)]])
          table.insert(affStr,aff:title())	                  
     elseif aff == "epseth" or aff == "crippledleg" then
        if affstrack.score["leftleg"] < 100 then       
           affstrack.score["leftleg"] = 100
           ak.AddedAffReset("leftleg") 
        elseif affstrack.score["rightleg"] < 100 then       
           affstrack.score["rightleg"] = 100
           ak.AddedAffReset("rightleg") 
        end
        table.insert(affStr,"Epseth")
     elseif aff == "epteth" or aff == "crippledarm" then
        if affstrack.score["leftarm"] < 100 then       
           affstrack.score["leftarm"] = 100
           ak.AddedAffReset("leftarm") 
        elseif affstrack.score["rightarm"] < 100 then       
           affstrack.score["rightarm"] = 100
           ak.AddedAffReset("rightarm") 
        end
        table.insert(affStr,"Epteth")    
		elseif aff == "frozen" then 
        affstrack.score[aff] = affstrack.score[aff] + 100
        table.insert(affStr,aff:title())
        if affstrack.score.frozen > 300 then
           affstrack.score.frozen = 300
        end 
		elseif aff == "deepfreeze" then
        affstrack.score["frozen"] = affstrack.score["frozen"] + 200 
        table.insert(affStr,"Frozen") 
        if affstrack.score.frozen > 300 then
           affstrack.score.frozen = 300
        end		                                         
     elseif affstrack.score[aff] then
        if affstrack.score[aff] < 100 then       
           affstrack.score[aff] = 100
           ak.AddedAffReset(aff)
           if aff == "deaf" or aff == "sensitivity" then 
              aff = "prefarar" 
           end
			   if aff == "hypochondria" then
				   enableTimer("Hypochondria Timer")
			   end
			   if aff == "hellsight" then
				   affstrack.score.slickness = 100
			   end
           table.insert(affStr,aff:title())   
        end
     elseif affstrack.venoms[aff] then 
        if affstrack.score[affstrack.venoms[aff]] < 100 then    
           affstrack.score[affstrack.venoms[aff]] = 100
           ak.AddedAffReset(affstrack.venoms[aff])
           if aff == "deaf" or aff == "sensitivity" then 
              aff = "prefarar" 
           end
           table.insert(affStr,affstrack.venoms[aff]:title())       
        end 
     end
	end
	if #affStr > 0 then 
			ak.echogain(table.concat(affStr, " ")) 
			if rtpkrnl then ApK(table.concat(affStr, " rtpkrnl ")) end--AKG Display
	end
	ak.scoreup(target)
end

function OppLostAff(aff)
	local affStr = ""
	aff = aff:lower()
	if string.find(aff," ") then
		for word in string.gmatch(aff, "%a+") do
			if affstrack.score[word] > 0 then
				affstrack.score[word] = 0
				affStr = word:title()
			end
		end
	else
		if affstrack.score[aff] > 0 then
			affstrack.score[aff] = 0
			affStr = aff:title()
		end
	end
   if affStr:len() > 0 then ak.echolost(affStr) end
	ak.scoreup(target)

end
