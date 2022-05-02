lodesize = matches[2]
lodetype = matches[3]
if lodesize == "small" or lodesize == "medium" or lodesize == "tiny" then

else
mmp.stop() --Mudlet mapper command
prospecting = 0
killTimer(tostring(prospectingtimer))
send("clan erc tell " ..lodetype .. " found at " .. gmcp.Room.Info.name.. " (" ..gmcp.Room.Info.num.. ") SIZE: " ..lodesize)
end


lodetable[gmcp.Room.Info.num] = {lodesize, lodetype, gmcp.Room.Info.name, gmcp.Room.Info.area}

