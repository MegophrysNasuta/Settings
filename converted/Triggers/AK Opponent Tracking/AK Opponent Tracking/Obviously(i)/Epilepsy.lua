if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if ak.ProTrackingConfirmed then 
      ak.ProTrackingConfirmed("epilepsy") 
   else
      affstrack.score.epilepsy = 100
      ak.scoreup(matches[2])
   end
end
