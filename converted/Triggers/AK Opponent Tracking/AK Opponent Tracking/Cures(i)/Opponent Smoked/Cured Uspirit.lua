if affstrack.score.asthma>0 then 
	if ak.thoughtIhad then ak.thoughtIhad("asthma") else affstrack.score.asthma = 0 end   
	ocured = ocured or {}
	ocured.smoked = {}
end

OppLostAff("unweavingspirit")
ak.psion.unweaving.spirit = 0
setTriggerStayOpen("Opponent Smoked", 0)
