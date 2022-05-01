if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then
	ak.softreset()
else
	if ak.defs.rebounding then 
		ak.defs.rebounding = false
		ak.defs.reRebounding = false
		cecho("\n\n<cyan> REBOUNDING TURNED OFF!")
		cecho("\n<cyan> DISABLED REDEF SINGLE!\n\n")
		ak.scoreup(target)
	else
		ak.defs.rebounding = true
		ak.defs.reRebounding = true
		cecho("\n\n<cyan> REBOUNDING TURNED ON!")
		cecho("\n<cyan> ENABLED REDEF SINGLE!\n\n")
		ak.scoreup(target)
	end
end
