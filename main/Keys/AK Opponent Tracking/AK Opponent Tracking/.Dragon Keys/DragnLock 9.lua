if table.contains(ak.MovementKeys, gmcp.Char.Name.name) then

else
	ak.stack = "dlock"
	cecho("\n\n<cyan> CHANGING STACK TO:        Dragon LOCK!!\n\n")
	send("wipe dirk")
	send("wipe claws")
	ak.scoreup(target)
end
