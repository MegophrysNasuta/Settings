setTriggerStayOpen("mmp Lusternia kaleidoscope", 0)

--[[for area, names in pairs(mmp.tempscent) do
	for _, name in ipairs(names) do

-- get the name
cecho("\n<green>"..name.."<reset>: ")

-- ids
mmp.echonums(area)

-- pad spaces so we have aligned roomname
echo(string.rep(" ", 25))

-- and finally, the roomname
echo(area)
end
end]]


raiseEvent("mmapper updated pdb")
