if IsTargetted(matches[2]) then 
   OppGainedAff("healthleech")
end
ak.animalsup = ak.animalsup or {}
local animaltoremove = "fox"
if table.contains(ak.animalsup, animaltoremove) then
   for i = 1, #ak.animalsup do
      if ak.animalsup[i] == animaltoremove then
         table.remove(ak.animalsup,i)
      end
   end
end