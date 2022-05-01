if ak.ai() then return end
if IsTargetted(matches[2]) then
   for i=1, #affstrack.whisperlist do
    if affstrack.score[affstrack.whisperlist[i]] > 0 then
      if ak.thoughtIhad then 
        ak.thoughtIhad(affstrack.whisperlist[i]) 
        return  
      end 
    end
   end
end
