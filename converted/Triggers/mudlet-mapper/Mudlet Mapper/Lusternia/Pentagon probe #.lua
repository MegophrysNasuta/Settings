local t = mmp.getnums(multimatches[2][2])
if not t then return end

echo"\n"

if #t == 1 then
	cecho("<red>From your knowledge, that room is in <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>.")
else
	cecho("<red>From your knowledge, that room might be in <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>.")
end
