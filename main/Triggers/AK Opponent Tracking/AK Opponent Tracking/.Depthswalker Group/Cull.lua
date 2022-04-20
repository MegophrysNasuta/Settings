if IsTargetted(multimatches[2][2]) then 
   enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
   enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
   weaponattack = weaponattack or {}
   table.insert(weaponattack, multimatches[2][3])
end
