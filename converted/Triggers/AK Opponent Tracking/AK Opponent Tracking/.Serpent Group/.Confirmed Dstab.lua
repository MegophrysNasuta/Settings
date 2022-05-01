if ak.ai() then return end
cecho("<cyan>.")
hitrelay = {"1"}
currentvenoms = currentvenoms or {}
weaponattack = weaponattack or {}
if #weaponattack > 0 then 
   for i = 1, #weaponattack do
      currentvenoms[weaponattack[i]] = currentvenoms[weaponattack[i]] or {1}
      table.insert(hitrelay, affstrack.venoms[currentvenoms[weaponattack[i]][1]])
      table.remove(currentvenoms[weaponattack[i]], 1)  
   end
end
if #hitrelay > 1 then 
   if table.contains(hitrelay, "1") then table.remove(hitrelay, "1") end
   OppGainedAff(table.concat(hitrelay, " ")) 
end
weaponattack = nil
disableTrigger("Missed Dstab Removal")                --DO NOT CHANGE!
disableTrigger("Confirmed Dstab")  
--ak.deleteFull()
deleteLine()
ak.showPrompt()

