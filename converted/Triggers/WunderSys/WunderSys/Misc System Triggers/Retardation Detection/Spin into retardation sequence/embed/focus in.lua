focusVibes = true

--turn off the flag after 3s
if focusVibesTimer then killTimer(focusVibesTimer) end
focusVibesTimer = tempTimer(3, [[focusVibesTimer = nil;focusVibes = false]])


--turn off chain gates
setTriggerStayOpen("embed", 0)
setTriggerStayOpen("Spin into retardation sequence", 0)
