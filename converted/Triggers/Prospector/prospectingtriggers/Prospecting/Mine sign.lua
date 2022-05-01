mineowner = matches[2]

if minetable[minetype] == nil then
	minetable[minetype] = {}
end

loderoom[gmcp.Room.Info.num] = {osminesize, mineowner, minelode, mineprogress, gmcp.Room.Info.name, gmcp.Room.Info.area}
table.insert(minetable[minetype], loderoom)
