-- A sudden sense of wrongness overwhelms you.
--You realise with horror that the eldritch utterence has caused 2 insanities to descend upon you.
-- Possible pool: confusion, dementia, stupidity

local count = tonumber( matches[2] )

-- Confusion and dementia are both cured by ash, so predict them first.
-- Stupidity will likely be caught be secondary affs, so predict it last
send("curing predict confusion")
if count >= 2 then
	send("curing predict dementia")
end
if count >= 3 then
	send("curing predict stupidity")
end
