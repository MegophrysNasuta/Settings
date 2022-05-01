if IsTargetted(matches[3]) then
   weaponattack = weaponattack or {}
   enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
   enableTrigger("Confirmed Hit")  
   table.insert(weaponattack, matches[2])
end
