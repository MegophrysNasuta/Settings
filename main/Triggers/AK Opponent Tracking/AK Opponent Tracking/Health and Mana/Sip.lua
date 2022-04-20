if IsTargetted(matches[2]) then
	if affstrack.score.anorexia>0 then 
		if ak.thoughtIhad then 
			ak.thoughtIhad("anorexia") 
		else 
			affstrack.score.anorexia = 0 
		end  
	end
	if affstrack.score.voyria > 0 then
		affstrack.score.voyria = 0
	elseif (not ak.defs.speed) then
		if not SpeedTimer then
			SpeedTimer = tempTimer(4.5,[[
      	ak.defs.speed = true
      	SpeedTimer = false 
      	ak.scoreup(]]..matches[2]..[[)  
      	]])
		end
	else
     --ak.currentmana
     --ak.maxmana
	end
	ak.scoreup(matches[2])
end
