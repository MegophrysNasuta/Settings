if wsys.settings.keepup[wsys.profile][wsys.myClass()]["heldbreath"] then
 wsys.report("<yellow>No longer HOLDING BREATH")
 wsys.unkeepup("heldbreath", true)
else
 wsys.keepup("heldbreath", true)
 wsys.report("<yellow>HOLDING BREATH")
end -- if
