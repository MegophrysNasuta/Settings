talisman.highlight()
local talismankey = talisman.getkey(multimatches[2][2])
if talismankey then
	local initcount = talisman.getcount(talismankey)
	talisman.announce(talismankey, tonumber(multimatches[2][3]))
	talisman.add(talismankey, tonumber(multimatches[2][3]), 1)
	if layout then
		layout.chatAppend(string.format("<CadetBlue>%s (%d)(%s)\n", line, talisman.getcount(talismankey), (Denizen or "?")), true)
	end
elseif layout then
	layout.chatAppend(string.format("<CadetBlue>%s (unknown?)\n", line))
end
