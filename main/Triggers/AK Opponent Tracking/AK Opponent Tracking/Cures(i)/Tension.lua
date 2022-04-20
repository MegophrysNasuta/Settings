if ak.ai() then return end
local aff = "tension"
if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(aff) end
affstrack.score[aff] = 0
ak.scoreup(matches[2])
