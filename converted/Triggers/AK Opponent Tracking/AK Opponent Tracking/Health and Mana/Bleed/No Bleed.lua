if ak.bleeding and ak.bleeding > 0 and affstrack.score.haemophilia > 0 then
	ak.thoughtIhad("haemophilia")
end
ak.bleeding = 0
ak.scoreup(matches[2])
