if ak.ai() then return end
enableTrigger("Missed Single Removal")                --DO NOT CHANGE!
enableTrigger("Confirmed Hit")                        --DO NOT CHANGE!
if weaponattack == nil then weaponattack = {} end
if matches[2] == "claws" then
   table.insert(weaponattack, "your wickedly sharp claws")
elseif matches[2] == "vines" then
   table.insert(weaponattack, "the thorny vines covering your arms")
else
   table.insert(weaponattack, matches[2])
end
--display(weaponattack)
