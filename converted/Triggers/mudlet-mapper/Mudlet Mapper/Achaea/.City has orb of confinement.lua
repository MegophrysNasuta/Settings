 -- disabled since the orb is now an rng chance and not a 100% blocker

local orbTable = mmp.getAchaeaOrbTable()
local areaID = getRoomArea(mmp.currentroom) or 0
if areaID == 0 or mmp.game ~= "achaea" then
  return
end
--don't know where we are
for city, areas in pairs(orbTable) do
  if table.contains(areas, areaID) then
    if not mmp.settings["orb" .. city] then
      mmp.settings:setOption("orb" .. city, true)
      mmp.inside = true
      raiseEvent("mmapper went inside")
      if mmp.autowalking then
        mmp.gotoRoom(mmp.speedWalkPath[#mmp.speedWalkPath])
      end
    end
    return
  end
end
if mmp.autowalking then
  mmp.stop()
end
