if ak.ai() then return end
if IsTargetted(matches[2]) and ak.thoughtIhad then
   affstrack.score.prone = 0
   affstrack.score.scalded = 0  
   ak.thoughtIhad("nausea") 
   ak.thoughtIhad("paralysis") 
elseif IsTargetted(matches[2]) then
   affstrack.score.prone = 0
   affstrack.score.scalded = 0
   affstrack.score["nausea"] = 0
   ak.scoreup(matches[2])
end
