wsysf.aff_tracking.twoh = wsysf.aff_tracking.twoh or {}
wsysf.aff_tracking.twoh.precision = {}


wsysf.aff_tracking.twoh.focus_prec = function( person )
	if wsysf.aff_tracking.twoh.precision[person] then
		killTimer( wsysf.aff_tracking.twoh.precision[person] )
	end
	wsysf.aff_tracking.twoh.precision[person] = tempTimer( 2, function()
		wsysf.aff_tracking.twoh.precision[person] = nil
	end)
end

wsysf.aff_tracking.twoh.fractureup = function( aff )
	local person = wsysf.aff_tracking.twoh.current_person
	local count = 1
	
	if wsysf.aff_tracking.twoh.precision[ person ] then
		-- If the current person had focused precision, increase by 2
		count = 2
		killTimer( wsysf.aff_tracking.twoh.precision[ person ] )
		wsysf.aff_tracking.twoh.precision[ person ] = nil
		wsysf.aff_tracking.twoh.current_person = nil
	end
	
	wsysf.aff_tracking.stack_up( aff, count )
end
