if ak.ai() then return end
if IsTargetted(matches[2]) then
	if affstrack.score.crushedthroat>0 then 
		if ak.thoughtIhad then 
			ak.thoughtIhad("crushedthroat") 
		else 
			affstrack.score.crushedthroat = 0 
		end  
	end
end
