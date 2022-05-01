if ak.ai() then return end
if IsTargetted(matches[2]) then
   if FocusCount() == 0 and affstrack.score.impatience == 100 then
      if ak.ProTrackingConfirmed then 
         ak.ProTrackingConfirmed("stupidity") 
      else 
         affstrack.score.stupidity = 100
      end
      affstrack.score.impatience = 0
      ak.scoreup(matches[2])
   elseif affstrack.score.impatience > 0 then
      if ak.ProTrackingConfirmed then 
         ak.ProTrackingConfirmed("stupidity") 
      else 
         affstrack.score.stupidity = 100
         ak.scoreup(matches[2])
      end
      --affstrack.score.impatience = 100
      --ak.scoreup(matches[2])
   else
      if ak.ProTrackingConfirmed then 
         ak.ProTrackingConfirmed("stupidity") 
      else 
         affstrack.score.stupidity = 100
         ak.scoreup(matches[2])
      end
   end
end
