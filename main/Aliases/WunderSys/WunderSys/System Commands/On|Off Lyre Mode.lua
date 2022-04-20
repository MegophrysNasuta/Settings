if matches[2] then
 wsys.uselyre = false
 wsys.checkaffs()
 wsys.report("<yellow>Lyre Mode<red> DISABLED")
 send("curing on", false)
else
 wsys.uselyre = true
 wsys.lyrequeue()
 wsys.report("<yellow>Lyre Mode<red> ENABLED")
 send("curing off", false)
end -- if
