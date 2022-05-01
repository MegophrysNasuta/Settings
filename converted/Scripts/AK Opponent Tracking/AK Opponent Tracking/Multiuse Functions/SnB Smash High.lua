-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.SnBSmashHighAff(currentstaby)
	local shAff = "dizziness"
	if affstrack.score.dizziness < 100 and not table.contains(currentstaby,"dizziness") then
		 shAff = "dizziness"
	elseif affstrack.score.recklessness < 100 and not table.contains(currentstaby,"recklessness") then
		 shAff = "recklessness"
	elseif affstrack.score.stupidity < 100 and not table.contains(currentstaby,"stupidity") then
		 shAff = "stupidity"
	elseif affstrack.score.confusion < 100 and not table.contains(currentstaby,"confusion") then
		shAff = "confusion"
	elseif affstrack.score.epilepsy < 100 and not table.contains(currentstaby,"epilepsy") then
		 shAff = "epilepsy"
	end
	return shAff
end
