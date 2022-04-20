if ak.ai() then return end
ak.diagnosingoffbal = false
ak.deleteFull()
if currentlydiagnosingak and currentlydiagnosingak ~= "" then
   send(currentlydiagnosingak)
end
