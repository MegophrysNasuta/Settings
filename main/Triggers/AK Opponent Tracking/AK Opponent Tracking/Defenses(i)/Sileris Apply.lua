if IsTargetted(matches[2]) then
	 if ak.ai() then return end
   ak.defs.sileris = false
   if affstrack.score.slickness>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("slickness") else affstrack.score.slickness = 0 end 
   end
   if silerisaktime then killTimer(silerisaktime) end
   silerisaktime = tempTimer(9,[[ak.defs.sileris = true]])
	 ak.scoreup(matches[2])
end
