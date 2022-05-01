deleteLine()
local from,fromhouse = multimatches[2][2]:gsub(" %(house%)","")
local to,tohouse = multimatches[2][3]:gsub(" %(house%)","")
if fromhouse >= 1 then fromhouse = " (house)" else fromhouse = "" end
if tohouse >= 1 then tohouse = " (house)" else tohouse = "" end
cecho("\nYou see a connection between ".. from .. fromhouse .. " (")
mmp.echonums(from, gmcp.Room.Info.area)
cecho(") and "..to..tohouse.." (")
mmp.echonums(to)
cecho(")")

