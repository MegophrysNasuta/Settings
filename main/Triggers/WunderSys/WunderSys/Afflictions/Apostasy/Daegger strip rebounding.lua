if wsys.timer.reboundingdelay then
 killTimer(tostring(wsys.timer.reboundingdelay))
end
wsys.timer.reboundingdelay = nil
wsys.undef("rebounding")
