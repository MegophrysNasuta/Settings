if ak.ai() then return end
if ak.thoughtIhad then 
   ak.thoughtIhad(matches[3]) 
else
   affstrack.score[matches[3]] = 0
   ak.scoreup(matches[2])
end
ak.diagnosingoffbal = true
