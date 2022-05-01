if not ak.currentsmoke then return end
deleteLine()
if not ak.defs.reRebounding then 
	affssmoke() 
	ocured = ocured or {}
	ak.randomaffs = ak.randomaffs or 0
	ocured.smoked = {}
	if affstrack.score.asthma>0 then 
		if ak.thoughtIhad then ak.thoughtIhad("asthma") else affstrack.score.asthma = 0 end   
		ocured = ocured or {}
		ocured.smoked = {}
	end
else
 	ocured = ocured or {}
	ak.randomaffs = ak.randomaffs or 0
	ocured.smoked = {}
	if affstrack.score.asthma>0 then 
	if ak.thoughtIhad then ak.thoughtIhad("asthma") else affstrack.score.asthma = 0 end
		ocured = ocured or {}
		ocured.smoked = {}
	end    
	ak.defs.reRebounding = false
	reboundingaccountak = true
	if reboundingaktime then killTimer(reboundingaktime) end
	reboundingaktime = tempTimer(11,[[reboundingaccountak = false]])
	ak.scoreup(ak.currentsmoke)
end
ak.currentsmoke = false
ak.showPrompt()
setTriggerStayOpen("Opponent Smoked", 0)
