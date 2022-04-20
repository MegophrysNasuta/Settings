if ak.ai() then return end
cecho("<LawnGreen>\nRelapsed!")
ak.shaman.relapse = false
ak.shaman.Relapseaff = matches[2]
local currentrelapse = matches[2]
if ak.ProTrackingConfirmed then 
	ak.ProTrackingConfirmed(currentrelapse) 
end 


