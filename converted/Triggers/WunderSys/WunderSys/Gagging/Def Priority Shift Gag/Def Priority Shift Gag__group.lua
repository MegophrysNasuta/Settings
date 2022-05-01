if multimatches[2] then
local theDef = multimatches[2][2]
local newPrio = tonumber(multimatches[2][3])
if wsys.settings.defup[wsys.profile][wsys.myClass()][theDef] or wsys.settings.keepup[wsys.profile][wsys.myClass()][theDef] or wsys.settings.gagdefshift then
  deleteFull()
  setTriggerStayOpen( "Def Priority Shift Gag", 1 ) 
end
end
