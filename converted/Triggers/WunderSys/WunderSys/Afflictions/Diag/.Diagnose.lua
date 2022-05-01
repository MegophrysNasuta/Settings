if wsys.timer.diagwait then
 killTimer(tostring(wsys.timer.diagwait))
 wsys.timer.diagwait = nil
 enableTrigger("Diag Lines")

 --wsys.aff = {}
 wsys.resetAffPrios()
 wsys.def.blindness = false
 wsys.def.deafness = false
 disableTrigger("Diagnose")
end -- if
