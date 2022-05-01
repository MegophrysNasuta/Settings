if table.is_empty(Tragedy.hits) then
    table.insert(Tragedy.hits, "hit1")
elseif table.contains(Tragedy.hits, "hit1") or table.contains(Tragedy.hits, "miss1") then
    table.insert(Tragedy.hits, "hit2")
end
--if checkLimbHit(matches[1]) then
--	whatLimb(matches[1])
--end
	
