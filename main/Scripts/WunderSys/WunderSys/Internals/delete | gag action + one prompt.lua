function deleteTwoLines()
	deleteLine() -- deletes second line
	moveCursor(0,getCurrentLineNumber()-1) --moves cursor up one line
	deleteLine() -- deletes first line
end
