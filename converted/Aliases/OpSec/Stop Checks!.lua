killTimer(opsec.runTimer)
cecho('\n<red>Stopping opsec run!\n')
if opsec.lastPose then send('pose '.. opsec.lastPose) end
opsec.posed = false
