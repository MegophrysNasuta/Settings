if ak.ai() then return end
if ak.ProTrackingConfirmed then 
   ak.ProTrackingConfirmed(matches[4]) 
else 
   affstrack.score[matches[4]] = 100
   ak.scoreup(matches[2])
end
ak.diagnosingoffbal = true

