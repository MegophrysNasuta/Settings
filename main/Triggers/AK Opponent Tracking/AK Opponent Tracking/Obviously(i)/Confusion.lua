if ak.ai() then return end
if IsTargetted(matches[2]) then 
  if ak.ProTrackingConfirmed then 
     ak.ProTrackingConfirmed("confusion") 
  else
     affstrack.score.confusion = 100
     ak.scoreup(matches[2])
  end
end
