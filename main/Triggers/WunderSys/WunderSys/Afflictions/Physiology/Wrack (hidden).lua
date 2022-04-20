--sanguine: either Haemophilia, recklessness, paralysis
if multimatches[2][2] == "sanguine" then
	send("clot")
	wsys.recklessnesscheck()

--Melancholic: Anorexia, impatience, stupidity
elseif multimatches[2][2] == "melancholic" then
	--impatiencecheck()

--Phlegmatic: Asthma, clumsiness, disloyalty
elseif multimatches[2][2] == "phlegmatic" then
	--no pipe bal, so lets just smoke that
	--wsys.affadd("disloyalty")

--Choleric: Nausea, sensitivity, slickness
elseif multimatches[2][2] == "choleric" then
	--no pipe bal, so just smoke
	--wsys.affadd("slickness")
end

wsys.newClassTimer("alchemist")
