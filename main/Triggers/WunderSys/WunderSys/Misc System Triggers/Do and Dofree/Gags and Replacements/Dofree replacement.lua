selectString(matches[2]..matches[3], 1)
bg("black") fg("SkyBlue")
replace(wsys.dofreeSub[tonumber(matches[3])])
resetFormat()
deselect()
wsys.dofreeSub[tonumber(matches[3])] = matches[4]
