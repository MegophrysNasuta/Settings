if IsTargetted(multimatches[2][2]) then
	 if ak.ai() then return end
   ak.defs.sileris = true
   if affstrack.score.slickness>0 then 
     if ak.thoughtIhad then ak.thoughtIhad("slickness") else affstrack.score.slickness = 0 end
     if silerisaktime then killTimer(silerisaktime) end
   end
	 ak.scoreup(multimatches[2][2])
end
