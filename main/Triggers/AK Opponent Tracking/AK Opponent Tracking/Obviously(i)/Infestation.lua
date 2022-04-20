if ak.ai() then return end
if IsTargetted(multimatches[2][2]) then 
   if ak.ProTrackingConfirmed then
      ak.ProTrackingConfirmed(multimatches[2][3]) 
   else
      affstrack.score[multimatches[2][3]] = 100
      ak.scoreup(multimatches[2][2])
   end
end
