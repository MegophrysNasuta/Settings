ak.songoff = true
selectCurrentLine() fg("GreenYellow") deselect() resetFormat()

if IsTargetted(matches[2]) then
	ak.defs.rebounding = false
	ak.defs.shield = false
	ak.scoreup(matches[2])
end
