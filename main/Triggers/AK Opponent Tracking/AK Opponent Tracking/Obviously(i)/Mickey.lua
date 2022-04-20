if ak.ai() then return end
if IsTargetted(matches[2]) then 
   ak.mickey = false
   if ak.ProTrackingConfirmed then 
      ak.ProTrackingConfirmed("nausea") 
   else
      affstrack.score.nausea = 100
      ak.scoreup(matches[2])
   end
end
