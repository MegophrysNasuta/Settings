if table.contains(Tragedy.hits, "hit2") then
    table.remove(Tragedy.hits, table.index_of(Tragedy.hits, "hit2"))
    table.insert(Tragedy.hits, "miss2")
else
    table.remove(Tragedy.hits, table.index_of(Tragedy.hits, "hit1"))
    table.insert(Tragedy.hits, "miss1")
end
--[[if target.martellato then
	target.martellato = false
end
if target.pesante then
	target.pesante = false
end]]--
