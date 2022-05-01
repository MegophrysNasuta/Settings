if matches[2] == "on" then
 retardationOn()
 wsys.report("<red>RETARDATION curing enabled")
else
 wsys.retardationOff()
 wsys.report("<red>RETARDATION curing disabled")
end -- if
