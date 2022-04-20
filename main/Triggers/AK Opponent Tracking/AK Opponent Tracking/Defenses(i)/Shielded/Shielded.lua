if IsTargetted(matches[2]) then
	 if ak.ai() then return end
   ak.shieldwhore = true
   tempTimer(5,[[ak.shieldwhore = false]])
   ak.defs.shield = true
   ak.scoreup(matches[2])
end
