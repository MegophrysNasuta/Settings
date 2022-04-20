if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then

else
	if ak.defs.shield then 
		ak.defs.shield = false
		cecho("\n\n<cyan> SHIELDING TURNED OFF!")
		ak.scoreup(target)
	else 
		ak.defs.shield = true
		cecho("\n\n<cyan> SHIELDING TURNED ON!")
		ak.scoreup(target)
	end
end
