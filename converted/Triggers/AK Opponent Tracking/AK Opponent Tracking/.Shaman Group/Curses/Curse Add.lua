if ak.ai() then return end
if not IsTargetted(multimatches[2][2]) then return end
ak.bleedincrease = 40 --curse
local curse = multimatches[2][3]
if curse then
	 curse = curse:lower()
   if curse ~= "breach" and curse ~= "tzantza" and curse ~= "inflame" then
	 		if affstrack.score[curse] then
				OppGainedAff(curse)
			elseif curse == "peace" then 
         curse = "pacifism"
				 OppGainedAff(curse)  
      elseif curse == "paralyse" then 
         curse = "paralysis"
				 OppGainedAff(curse)  
      elseif curse == "plague" then
          curse = "voyria"
					OppGainedAff(curse)
      elseif curse == "clumsy" then
          curse = "clumsiness" 
					OppGainedAff(curse)
      elseif curse == "dizzy" then
          curse = "dizziness" 
					OppGainedAff(curse)
      elseif curse == "stupid" then
          curse = "stupidity" 
					OppGainedAff(curse)
      elseif curse == "vomiting" then
          curse = "nausea" 
					OppGainedAff(curse)
      elseif curse == "reckless" then
          curse = "recklessness"
					OppGainedAff(curse)
			elseif curse == "fear" then
          ak.tumbling = false
					ak.scoreup(multimatches[2][2])
			elseif curse == "bleed" then
			
			else
				cecho("Unknown Curse <cyan>"..curse) 
      end
   end
end
if ak.shaman and ak.shaman.pararedo and ak.shaman.pararedo == "init" then 
	ak.shaman.pararedo = true 
elseif ak.shaman and ak.shaman.pararedo then
	ak.shaman.pararedo = false	
end



