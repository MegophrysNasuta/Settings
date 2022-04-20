if ak.ai() then 
	setTriggerStayOpen("Opponent Tree", 0)
	return
elseif not IsTargetted(matches[2]) then
	setTriggerStayOpen("Opponent Tree", 0)
	return
else
	ak.currenttree = matches[2]
end

