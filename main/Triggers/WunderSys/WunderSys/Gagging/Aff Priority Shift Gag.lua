local newPrio = tonumber(multimatches[2][3])
local theAff = multimatches[2][2]
wsys.affPrioChanged( theAff, newPrio )
if (wsys.defaultAffPosition(theAff) == newPrio) or wsys.settings.gagaffshift then
  deleteFull()
end
