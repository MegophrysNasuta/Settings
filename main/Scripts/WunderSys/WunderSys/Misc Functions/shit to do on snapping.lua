local gotSnapped = false


function wsys.realSnap()
	gotSnapped = true
	if wsys.timer.gotSnappedTimer then killTimer(wsys.timer.gotSnappedTimer) end
	wsys.timer.gotSnappedTimer = tempTimer(15, [[wsys.timer.gotSnappedTimer = nil;gotSnapped = false]])
	wsys.mwOnSnap()
end

function wsys.is_GotSnapped()
	return gotSnapped
end


function wsys.mwOnSnap()
	wsys.dofreeadd("metawake on")
	if wsys.timer.mwOnSnapTimer then killTimer(wsys.timer.mwOnSnapTimer) end
	wsys.timer.mwOnSnapTimer = tempTimer(7, [[ wsys.sleepLockCheck() ]])
end

function wsys.sleepLockCheck()
   wsys.timer.mwOnSnapTimer = nil
	if not wsys.aff.hypersomnia and wsys.def.insomnia then
		send("metawake off")
	end
end

