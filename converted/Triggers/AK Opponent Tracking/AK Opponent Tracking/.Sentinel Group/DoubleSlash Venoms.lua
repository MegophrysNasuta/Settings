if IsTargetted(matches[2]) then
   weaponattack = weaponattack or {}
   enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
   enableTrigger("Confirmed Hit")  
   table.insert(weaponattack, matches[3])
end
