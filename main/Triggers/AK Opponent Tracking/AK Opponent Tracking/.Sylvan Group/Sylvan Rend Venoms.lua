enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
weaponattack = weaponattack or {}
if matches[2] == "claws" then
   table.insert(weaponattack, "your wickedly sharp claws")
elseif matches[2] == "vines" then
   table.insert(weaponattack, "the thorny vines covering your arms")
else
   table.insert(weaponattack, matches[2])
end
if affstrack.crushedherb then
   currentvenoms = currentvenoms or {}
   currentvenoms["the thorny vines covering your arms"] = currentvenoms["the thorny vines covering your arms"] or {}
   table.insert(currentvenoms["the thorny vines covering your arms"], affstrack.crushedherb)
   table.insert(weaponattack, "the thorny vines covering your arms")
end
--display(weaponattack)
