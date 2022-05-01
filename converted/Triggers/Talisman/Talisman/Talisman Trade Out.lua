-- NOTE: this trigger does not remove pieces.. We assume you used the trade alias, which removed them
-- This means you should not manually trade or it will lose track of pieces.
talisman.highlight()
local talismankey = talisman.getkey(multimatches[2][3])
if talismankey then
	talisman.announce(talismankey, 0)
end
if layout then
	layout.chatAppend("<CadetBlue>"..line.."\n", true)
end

