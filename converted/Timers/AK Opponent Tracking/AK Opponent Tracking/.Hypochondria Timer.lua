if affstrack.score.hypochondria > 0 then
   for i = 1, #affstrack.hypo do
      if affstrack.score[affstrack.hypo[i]] ~= 100 then
         if affstrack.hypo[i] ~= "impatience" then
            affstrack.score[affstrack.hypo[i]] = 100
            ak.scoreup(target)
            return
         end
      end
   end
else
   disableTimer("Hypochondria Timer")
end
