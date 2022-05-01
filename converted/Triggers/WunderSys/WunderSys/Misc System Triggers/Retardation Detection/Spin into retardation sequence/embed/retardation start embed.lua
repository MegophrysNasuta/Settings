retardVibeHit = true

--turn off the flag after 3s
if retardVibeHitTimer then killTimer(retardVibeHitTimer) end
retardVibeHitTimer = tempTimer(3, [[retardVibeHitTimer = nil;retardVibeHit = false]])

--turn off chain gates
setTriggerStayOpen("embed", 0)
setTriggerStayOpen("Spin into retardation sequence", 0)
