ak.knownmaxhealth = ak.knownmaxhealth or {}
ak.knownmaxhealth[matches[2]] = matches[4] 
ak.currenthealth = matches[3]
ak.maxhealth = matches[4]
local currHealth = math.ceil((matches[3]/matches[4])*100)
ak.healthpercent = currHealth
ak.scoreup(matches[2])

