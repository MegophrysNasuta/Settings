wsys.kaiboost_flags = wsys.kaiboost_flags or {}
function wsys.kaiboostcancel()
  wsys.kaiboost_flags.disabled = true
  send("curing priority defence kaiboost reset", false)
end

function wsys.kaiboostcheck()
 if wsys.kaiboost_flags.disabled and wsys.cancure() and wsys.isClass("monk") and wsys.settings.keepup[wsys.profile]["monk"]["kaiboost"] and 
    not wsys.def.kaiboost and wsys.stats.kai >= 11 then
  wsys.kaiboost_flags.disabled = false
  wsys.enableSSDef( "kaiboost", wsys.settings.defprio[wsys.profile][wsys.myClass()].kaiboost, true )
 end -- if
end -- func
