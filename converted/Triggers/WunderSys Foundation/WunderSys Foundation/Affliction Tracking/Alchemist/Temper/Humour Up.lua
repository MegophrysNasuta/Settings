local aff = "tempered"..matches[2]

if wsysf.affv[aff] >= 5 then
	wsysf.aff_tracking.stack_up( aff, 2 )
else
	wsysf.aff_tracking.stack_up( aff )
end
