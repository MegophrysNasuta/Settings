-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.AfflictionCured(affliction, who)
	ak.trackPrios(affliction)
	if affliction == "haemophilia" then
		if ak.bleeding > 200 then
			ak.shaman.GetFashions = true
		end
		affstrack.score.bloodfire = 0
		ak.bleeding = 0
		ak.scoreup(who)
	end
	if ak.AustCuredTrack then
		ak.AustCuredTrack(affliction)
	end
end

	
