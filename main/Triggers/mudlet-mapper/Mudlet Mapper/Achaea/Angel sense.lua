local t = mmp.getnums(multimatches[2][2], true)
if not t then return end
if #t == 1 then
	cecho(" <orange_red>("..mmp.cleanAreaName(mmp.areatabler[getRoomArea(t[1])])..")")
else
	cecho(" <orange_red>Maybe ("..mmp.cleanAreaName(mmp.areatabler[getRoomArea(t[1])])..")")
end
echo " "; mmp.echonums(multimatches[2][2])

mmp.temp_room = multimatches[2][2]
