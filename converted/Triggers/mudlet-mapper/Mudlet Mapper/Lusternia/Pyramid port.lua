local t = mmp.getnums(multimatches[2][2])
if not t then return end

echo"\n"

if #t == 1 then
	cecho("<red>Porting to <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>.")
else
	cecho("<red>Might be porting to <orange_red>"..mmp.areatabler[getRoomArea(t[1])].."<red>.")
end	
