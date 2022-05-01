if ak.ai() then return end
if IsTargetted(matches[2]) then 
   if ak.ProTrackingConfirmed then 
      ak.ProTrackingConfirmed("haemophilia") 
   else
      affstrack.score.haemophilia = 100
      ak.scoreup(matches[2])
  end
end
