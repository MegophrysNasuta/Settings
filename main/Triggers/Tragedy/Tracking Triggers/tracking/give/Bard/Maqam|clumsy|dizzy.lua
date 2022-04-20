if isTarget(matches[2]) then
	if not tarAff("clumsiness") then
		Tragedy.TrackerAdd("clumsiness")
	else
		Tragedy.TrackerAdd("dizziness")
	end
end
