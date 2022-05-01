function wsys.burningStacks( num )
	if wsys.aff.burning ~= num then
		wsys.aff.burning = num
		wsys.newClassTimer( "magi" )
		raiseEvent( "got aff", "burning" )
	end
end

function wsys.burningDown()
	local count = wsys.aff.burning and tonumber(wsys.aff.burning) or 0
	if count and count > 1 then
		count = count - 1
	else
		count = 1
	end	
	wsys.aff.burning = count
	raiseEvent( "got aff", "burning" )
end

