if hypnosis_table[target] and hypnosis_table[target].load and #hypnosis_table[target].load > 0  then
   if hypnosis_table[target].load[#hypnosis_table[target].load] ~= "impatience" then
      OppGainedAff(hypnosis_table[target].load[#hypnosis_table[target].load])
      ak.scoreup(target)
   end
   table.remove(hypnosis_table[target].load, #hypnosis_table[target].load)
   if #hypnosis_table[target].load  == 0 then
      disableTimer("Hypnosis Timer")
      resetHypno = tempTimer(1,[[
         hypnosis_table[target].load = {}
      ]])
      ak.scoreup(target)
   end
else
   disableTimer("Hypnosis Timer")
   resetHypno = tempTimer(1,[[
      hypnosis_table[target].load = {}
   ]])
   ak.scoreup(target)
end
