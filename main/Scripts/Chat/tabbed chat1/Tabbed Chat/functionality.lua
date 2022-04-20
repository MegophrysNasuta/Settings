function nocase (s)
	s = string.gsub(s, "%a", function (c)
	return string.format("[%s%s]", string.lower(c),
                                  string.upper(c))
          end)
	return s
end


pickUpList = {"corpse", "sovereigns", "bound spyglass", "driftwood", "tinted glass bottle", " shard"}
function pickUp()
	for _, v in pairs(pickUpList) do	
		for _, j in pairs(itemlist) do
			if string.find(j.name, v) then
					svo.doaddfree("get " ..j.id)
			end
		end
	end
end

function ndbgetrgb(person) --returns rgb colour tag for decho
	person=person:title()
	local color=ndb.getcolorp(person)
	if not color then return("") else
		local rgb=string.format("%d,%d,%d",getRGB(color))
		return("<"..rgb..">")
	end
end

function recolourChat(line)
	local str=line
	selectString(str,1)
	local rgb=string.format("%d,%d,%d",getFgColor())
	local rgb="<"..rgb..">"
	deselect()
	fixedstring=string.gsub(str, "(%w+)", function(w) if ndb.isperson(w) then return ndbgetrgb(w)..w..rgb else return w end end)
	retrun(fixedstring)
end
