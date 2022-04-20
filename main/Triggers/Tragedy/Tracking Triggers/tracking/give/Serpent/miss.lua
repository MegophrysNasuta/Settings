if isTarget(matches[2]) then 
	if table.contains(Tragedy.hits, "hit2") then
    	table.remove(Tragedy.hits, table.index_of(Tragedy.hits, "hit2"))
    	table.insert(Tragedy.hits, "miss2")
	else
    	table.remove(Tragedy.hits, table.index_of(Tragedy.hits, "hit1"))
    	table.insert(Tragedy.hits, "miss1")
	end
end
