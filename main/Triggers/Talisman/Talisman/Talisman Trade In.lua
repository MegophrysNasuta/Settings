talisman.highlight()
local talismankey = talisman.getkey(multimatches[2][4])
if talismankey then
	talisman.announce(talismankey, tonumber(multimatches[2][3]))
	talisman.add(talismankey, tonumber(multimatches[2][3]), 1)
end
if layout then
	layout.chatAppend("<CadetBlue>"..line.."\n")
end
