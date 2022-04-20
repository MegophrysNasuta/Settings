if ak.ai() then return end
deleteLine()
cecho("<yellow>.")
boardaffs = boardaffs or {}
hitrelay = {}
currentvenoms = currentvenoms or {}
weaponattack = weaponattack or {}
if #weaponattack > 0 then
   for i = 1, #weaponattack do
      currentvenoms[weaponattack[i]] = currentvenoms[weaponattack[i]] or {1}
      table.insert(hitrelay, affstrack.venoms[currentvenoms[weaponattack[i]][1]])
      table.remove(currentvenoms[weaponattack[i]], 1)    
   end
end
if #boardaffs > 0 then
   for i = 1, #boardaffs do
	 		if boardaffs[i] == "HIGH" then
				table.insert(hitrelay, ak.SnBSmashHighAff(hitrelay))
			else
      	table.insert(hitrelay, boardaffs[i])
			end
   end
end
--display(hitrelay)
weaponattack = nil
boardaffs = {}
if #hitrelay == 1 then 
   OppGainedAff(hitrelay[1]) 
elseif #hitrelay > 1 then 
   OppGainedAff(table.concat(hitrelay, " ")) 
end
disableTrigger("Missed Single Removal")                --DO NOT CHANGE!
disableTrigger("Confirmed Hit")  
ak.limbs.deleteset = true
ak.showPrompt()


