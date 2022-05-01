local fullname = gmcp.Char.Name.fullname:gsub('%.', '%%.'):gsub('%-', '%%-')
local pose = matches[1]:gsub('Your current pose is: ', ''):gsub(fullname, '^')
opsec = (opsec or {})
opsec.lastPose = pose
