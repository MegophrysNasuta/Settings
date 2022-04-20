if matches[2] and IsTargetted(matches[2]) then
	 if ak.ai() then return end
   ak.mounted = true  
   affstrack.score.hamstring = 0
	 affstrack.score.prone = 0
	 affstrack.score.paralysis = 0
   ak.scoreup(matches[2])
elseif not matches[2] then
	 if ak.ai() then return end
   ak.mounted = true
   ak.scoreup(target)
end
