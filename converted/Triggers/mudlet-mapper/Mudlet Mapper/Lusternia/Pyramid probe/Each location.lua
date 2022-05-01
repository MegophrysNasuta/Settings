local t = mmp.getnums(matches[2])
if not t then return end

if #t == 1 then
	cecho("<red> (in <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>)")
else
	cecho("<red> (might be in <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>)")
end
