wsysf.aff_tracking.psion = {}
local psion = {}

wsysf.aff_tracking.psion.invert = function()
	local unweaves = { "unweavingspirit", "unweavingbody", "unweavingmind" }
	local from_weave = false
	local to_weave = false
	
	-- TODO: Really, this swaps the values. Does this work if you have some of both already?
	-- How do we know which are swapped?	
	for _,unw in ipairs( unweaves ) do
		if wsysf.aff_tracking.lost[unw] then
			from_weave = unw
		elseif wsysf.aff_tracking.new[unw] then
			to_weave = unw
		end
	end
	if from_weave and to_weave then
		wsysf.aff_tracking.set_aff_value( to_weave, wsysf.aff_tracking.lost[from_weave] )

		wsysf.core.debug.print( 5, "Unweave converted ".. from_weave .." to "..to_weave .. " value=".. wsysf.affs[to_weave] )
	end
end

