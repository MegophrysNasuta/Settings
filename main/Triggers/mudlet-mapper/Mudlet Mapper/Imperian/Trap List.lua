-- the first pattern is not blank, there are spaces there

selectCurrentLine()
replace("")
echo("[" .. multimatches[2][2] .. "] (" .. multimatches[2][3] .. ") at " .. multimatches[2][4])
mmp.roomEcho(multimatches[2][4]) 
