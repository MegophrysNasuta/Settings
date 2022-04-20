local count = wsysf.affv.manaleech + wsysf.affv.deadening + wsysf.affv.disloyalty + 1

if count > 3 then count = 3 end

wsysf.aff_tracking.stack_up("pressure", count)
