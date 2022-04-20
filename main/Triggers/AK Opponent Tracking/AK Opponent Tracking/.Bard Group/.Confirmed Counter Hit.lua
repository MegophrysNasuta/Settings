disableTrigger("Confirmed Counter Hit")
if target == matches[3] then
   enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
   enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
   if weaponattack == nil then weaponattack = {} end
   table.insert(weaponattack, matches[2])
end
--display(weaponattack)
