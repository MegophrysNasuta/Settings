local limb = matches[3]
if limb == "overhand" then
	limb = "head"
end

wsys.my_limb_hit(limb, "2h")
