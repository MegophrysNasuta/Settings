if ak.ai() then return end
local conversion = {
	["paralyse"] = "paralysis",
	["plague"] = "voyria",
	["clumsy"] = "clumsiness",
	["dizzy"] = "dizziness",
	["stupid"] = "stupidity",
	["vomiting"] = "nausea",
	["reckless"] = "recklessness",
	["nausea"] = "nausea",

}
ak.bleedincrease = 80
local setter = ""
ak.shaman.jinx = false
ak.jinxcount = ak.jinxcount - 1
if matches[2] ~= "breach" and matches[2] ~= "tzantza" then
	 if table.contains(conversion,matches[2]) then
	 	setter = setter.." "..conversion[matches[2]]
	 else
	 	setter = setter.." "..matches[2]
	 end
end
if matches[3] ~= "breach" and matches[3] ~= "tzantza" then
	 if table.contains(conversion,matches[3]) then
	 	setter = setter.." "..conversion[matches[3]]
	 else
	 	setter = setter.." "..matches[3]
	 end
end
if matches[2] == "tzantza" or matches[3] == "tzantza" then
	ak.tzantzajinxed = true
end
OppGainedAff(setter)




