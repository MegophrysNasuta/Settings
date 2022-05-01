selectCaptureGroup(2)
replace("")
rooms = mmp.searchRoomExact(matches[2])
local roomnum=next(rooms,nil)
if roomnum == nil or next(rooms, roomnum) then
  cecho("<white>(<sky_blue>" .. matches[2] .. "<white>)")
else
  local r, g, b = unpack(color_table["cyan"])
  cecho("<white>(")
  setTextFormat("", 0, 0, 0, r, g, b, false, true, false)
  echoLink(matches[2], [[mmp.gotoRoom(]] .. roomnum .. [[)]], "Walk to " .. matches[2] .. ".", true)
  cecho("<white>)")
  resetFormat()
end
