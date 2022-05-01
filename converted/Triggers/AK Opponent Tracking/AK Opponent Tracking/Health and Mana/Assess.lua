ak.knownmaxhealth = ak.knownmaxhealth or {}
ak.knownmaxhealth[multimatches[2][2]] = multimatches[2][4] 
ak.currenthealth = multimatches[2][3]
ak.maxhealth = multimatches[2][4]
local currHealth = math.ceil((multimatches[2][3]/multimatches[2][4])*100)
ak.healthpercent = currHealth
cecho("\n<white>[<blue>Health<white>]: <yellow>"..currHealth.."%")
if not ak.pause then send("pt "..multimatches[2][2].."'s health at "..ak.currenthealth.."/"..ak.maxhealth) end
ak.scoreup(multimatches[2][2])


