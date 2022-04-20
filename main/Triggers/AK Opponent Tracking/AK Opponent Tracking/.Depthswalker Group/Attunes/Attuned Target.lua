--cecho("\n\n\nFired!")
if matches[2] == target:lower():title() then
	ak.attuned = true
	enableTrigger("Unattuned Target")
	attunetimer = tempTimer(160, [[
		ak.attuned = false
		if svo then svo.boxDisplay("Target Unattuned", "red:black") end
	]])
end
