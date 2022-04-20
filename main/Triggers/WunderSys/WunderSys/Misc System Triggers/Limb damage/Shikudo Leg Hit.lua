local limb = ""
if matches[2] == "left thigh" then
	limb = "left leg"
elseif matches[2] == "right thigh" then
	limb = "right leg"
else
	limb = matches[2]
end

wsys.my_limb_hit(limb, "shikudo")
