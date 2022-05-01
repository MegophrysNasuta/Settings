if IsTargetted(matches[2]) and ak.defs.sileris then 
	 if ak.ai() then return end
   ak.defs.sileris = false
   ak.scoreup(matches[2])
end
