wsys.def.insomnia = false
if wsys.cure == "goldenseal" or wsys.cure == "plumbum" then
 wsys.emptyherb()
end -- if
wsys.def.speed = false
send("curing queue add speed")
