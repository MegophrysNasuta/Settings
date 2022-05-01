if ak.ai() then return end
if IsTargetted(matches[2]) then
   for i = 1, #affstrack.restored do 
      if affstrack.score[affstrack.restored[i]] > 0 and affstrack.score[affstrack.restored[i]] < 200 then 
         affstrack.score[affstrack.restored[i]] = 0   
      end
   end
   ak.scoreup(matches[2])
end

