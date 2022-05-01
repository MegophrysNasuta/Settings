ak.songoff = true
cecho("\n    <white>--== TARGET IS DEAF ==--<reset>")
if not matches[2] or IsTargetted(matches[2]) then
	affstrack.score.deaf = 0
	ak.scoreup(matches[2])
end
