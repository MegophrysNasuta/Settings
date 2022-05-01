-- All break limbs in 4
local limb = matches[2]

local map = {
	guts = "torso",
	throat = "head",
	skull = "head",
	eyes = "head",
	["left shoulder"] = "left arm",
	["right shoulder"] = "right arm",
}

limb = map[limb] or limb

wsys.my_limb_hit( limb, "psion")
