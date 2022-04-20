if ak.ai() then return end
if IsTargetted(matches[2]) then
  affstrack.score.prone = 0
  affstrack.score.paralysis = 0
  affstrack.score.transfixed = 0  
  affstrack.score.frozen = 0 
  ak.scoreup(matches[2])
end
