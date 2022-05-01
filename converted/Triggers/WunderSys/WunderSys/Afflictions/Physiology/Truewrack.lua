--sanguine: either Haemophilia, recklessness, paralysis
if multimatches[2][2] == "sanguine" or multimatches[2][3] == "sanguine" then
	send("clot")

--Melancholic: Anorexia, impatience, stupidity
elseif multimatches[2][2] == "melancholic" or multimatches[2][3] == "melancholic" then
	--impatiencecheck()

--Phlegmatic: Asthma, clumsiness, disloyalty
elseif multimatches[2][2] == "phlegmatic" or multimatches[2][3] == "phlegmatic" then
	--no pipe bal, so lets just smoke that
	--wsys.affadd("disloyalty")

--Choleric: Nausea, sensitivity, slickness
elseif multimatches[2][2] == "choleric" or multimatches[2][3] == "choleric" then
	--no pipe bal, so just smoke
	--wsys.affadd("slickness")
end

wsys.newClassTimer("alchemist")
