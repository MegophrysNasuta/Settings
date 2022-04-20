if ak.ai() then 
	setTriggerStayOpen("Opponent Smoked", 0)
	return
elseif not IsTargetted(matches[2]) then
	setTriggerStayOpen("Opponent Smoked", 0)
	return
else
	ak.currentsmoke = matches[2]
end


