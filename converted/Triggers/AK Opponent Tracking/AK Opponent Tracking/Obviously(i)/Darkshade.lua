if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then 
   if ak.ProTrackingConfirmed then 
      ak.ProTrackingConfirmed("darkshade") 
   else
      affstrack.score.darkshade = 100
      ak.scoreup(matches[2])
  end
end
