function wsys.prompt()
 wsys.affs_gained = {}

 if next(wsys.tb.affstogether) then
  wsys.firequeues()
 end -- if
 
 --if health is 0 you died, pause, clear affs, defs and timers
 if wsys.stats.h == 0 and wsys.stats.oh > 0 then
  raiseEvent("You Died")
  wsys.pause()
  --wsys.aff = {}
  for k in pairs(wsys.herbsout) do
   wsys.herbsout[k] = 0
  end -- for
  for k in pairs(wsys.def) do
   wsys.def[k] = false
  end -- for
  wsys.cleartimers()
  
  enableTrigger("Prompt Checks")
 end -- if

 if wsys.stats.h ~= wsys.stats.oh or wsys.stats.m ~= wsys.stats.om then
  wsys.checkManaThreshold()
  if wsys.softpaused and ((wsys.stats.h/wsys.stats.maxh)<(wsys.settings.unsoftpausehealth/100)) then wsys.unsoftpause() end
 end -- if

 if (wsys.stats.h ~= wsys.stats.maxh or wsys.stats.m ~= wsys.stats.maxm) and wsys.aff.recklessness then
   wsys.aff.recklessness = nil
 end

if not wsys.deletefull then
 wsys.promptsub()
else
 deleteLine()
 wsys.deletefull = false
end -- if

wsys.checkAutoMount()
wsys.kaiboostcheck()

if next(wsys.queuestable) then
 wsys.doqueues()
end -- if

end -- func



function wsys.addqueue(que)
 if not table.contains(wsys.queuestable, que) then
  wsys.queuestable[#wsys.queuestable+1] = que
 end -- if
end -- func


function wsys.doqueues()
 if next(wsys.queuestable) then
  for k,v in ipairs(wsys.queuestable) do
   _G["wsys"][v .. "queue"]()
  end -- for
  wsys.queuestable = {}
 end -- if
end -- func

wsys.queuestable = {}
