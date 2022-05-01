if ak.ai() then return end
local limbcheck = matches[2]
local lastpercentrelay = "lastpercent"..limbcheck
if affstrack.score[limbcheck] > 0 then
    if ak.thoughtIhad then ak.thoughtIhad(limbcheck) else affstrack.score[limbcheck] = 0 end
    ak.limbs.limbcount[target][limbcheck] = (ak.limbs.limbcount[target][lastpercentrelay])
    _G[target.."rightlegdisablelimbdamage"] = nil
    ak.scoreup(matches[3])
end
ak.deleteFull()
