function wsys.salviaSend(...)
	sendAll(...)
	wsys.addToSalviaSendTable(...)
end

function wsys.ssend(...)
	sendAll(...)
	wsys.addToSalviaSendTable(...)
end

wsys.salviaSendTable = wsys.salviaSendTable or {}

function wsys.clearSalviaSendTable()
	wsys.salviaSendTable = {}
end

function wsys.addToSalviaSendTable(...)
	local args = {...}
	if args[#args] ~= false then
	for i,v in ipairs(args) do
		if type(v) == "string" then
          wsys.salviaSendTable[#wsys.salviaSendTable+1] = v
		end
	end -- for
	end -- if
end

function wsys.salviaSendEcho()
	if next(wsys.salviaSendTable) then
		local salviaSendTableConcat = table.concat(wsys.salviaSendTable, "|", 1, #wsys.salviaSendTable)
		moveCursor(previousPromptLineNumberLength, previousPromptLineNumber)
		--echo("<blue>(<white>" .. salviaSendTableConcat .."<blue>)")
		fg("white")
		insertText("(" .. salviaSendTableConcat ..")")
		deselect()
		resetFormat()
		moveCursorEnd()
		wsys.clearSalviaSendTable()
	end
end

--registerAnonymousEventHandler("sysDataSendRequest", "wsys.salviaSendEcho")




