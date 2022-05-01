--deleteFull()
--add your own party's call style
if isTarget(matches[3]) then
	if matches[2] == "Batter" then
		Tragedy.noshowAdd("stupidity")
		Tragedy.noshowAdd("epilepsy")
		Tragedy.noshowAdd("dizziness")
	else
		Tragedy.noshowAdd(string.lower(matches[2]))
	end
end

--who tf do I trust?

