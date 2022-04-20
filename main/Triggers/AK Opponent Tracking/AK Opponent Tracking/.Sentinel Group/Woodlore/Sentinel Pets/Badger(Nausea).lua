if IsTargetted(matches[2]) then 
   OppGainedAff("nausea")
end
ak.animalsup = ak.animalsup or {}
local animaltoremove = "badger"
if table.contains(ak.animalsup, animaltoremove) then
   for i = 1, #ak.animalsup do
      if ak.animalsup[i] == animaltoremove then
         table.remove(ak.animalsup,i)
      end
   end
end
