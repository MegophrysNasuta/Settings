if IsTargetted(matches[2]) then 
   ak.defs.reRebounding = true
   ak.defs.shield = false
   ak.defs.rebounding = false
   weaponattack = weaponattack or {}
   enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
   enableTrigger("Confirmed Hit")  
   table.insert(weaponattack, ak.spear)
end
