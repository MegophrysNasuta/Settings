-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.RoomDefs()
	ak.lookghupdate = false
	ak.lookFloodupdate = false
	ak.looksubmergedupdate = false
  ak.lookdistortionupdate = false
	if ak.looksubmerged then killTrigger(ak.looksubmerged) end
	if ak.lookGH then killTrigger(ak.lookGH) end
	if ak.lookFlood then killTrigger(ak.lookFlood) end
  if ak.lookdistortion then killTrigger(ak.lookdistortion) end
	ak.lookGH = tempTrigger("Hands of rotting flesh and white bone push up from the ground.",[[
		ak.GhLookHanded()
	]])
	ak.lookFlood = tempTrigger("This area is unnaturally flooded with water.",[[
		ak.FloodLookHanded()
	]])	
	ak.looksubmerged = tempTrigger("This location is nearly completely submerged.",[[
		ak.submergedLookHanded()
	]])	
  ak.lookdistortion = tempTrigger("The surroundings are distorted, as if viewed through water.",[[
    ak.distortionLookHanded()
  ]])
end
function ak.GhLookHanded()
	killTrigger(ak.lookGH)
	ak.lookghupdate = true
end
function ak.FloodLookHanded()
	killTrigger(ak.lookFlood)
	ak.lookFloodupdate = true
end
function ak.submergedLookHanded()
	killTrigger(ak.looksubmerged)
	ak.looksubmergedupdate = true
end
function ak.distortionLookHanded()
  killTrigger(ak.lookdistortion)
  ak.lookdistortionupdate = true
end

function ak.GHLookPrompt()
	if ak.gravehands == ak.lookghupdate then return end
	ak.gravehands = ak.lookghupdate
	if ak.lookGH then killTrigger(ak.lookGH) end
	ak.lookGH = nil
	ak.scoreup(target)
end

function ak.FloodLookPrompt()
	if ak.flood == ak.lookFloodupdate then return end
	ak.flood = ak.lookFloodupdate
	if ak.lookFlood then killTrigger(ak.lookFlood) end
	ak.lookFlood = nil
	ak.scoreup(target)
end

function ak.submergedLookPrompt()
	if ak.submerged == ak.looksubmergedupdate then return end
	ak.submerged = ak.looksubmergedupdate
	if ak.looksubmerged then killTrigger(ak.looksubmerged) end
	ak.looksubmerged = nil
	ak.scoreup(target)
end

function ak.distortionLookPrompt()
	if ak.distortion == ak.lookdistortionupdate then return end
	ak.distortion = ak.lookdistortionupdate
	if ak.lookdistortion then killTrigger(ak.lookdistortion) end
	ak.lookdistortion = nil
	ak.scoreup(target)
end
