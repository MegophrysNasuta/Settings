if wsys.aff.blackout then
	wsys.aff.blackout = nil
	raiseEvent("lost aff", "blackout")
end

