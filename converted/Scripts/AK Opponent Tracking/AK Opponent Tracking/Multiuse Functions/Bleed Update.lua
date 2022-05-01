-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.bleedupdate(pushed)
	if gmcp.Char.Status.class == "Blademaster" then
		ak.bleeding = pushed -- More Bleeding
		ak.scoreup(target)
	else
		if ak.bleeding < pushed and affstrack.score.haemophilia > 0 then
			if ak.ProTrackingConfirmed and affstrack.score.haemophilia < 100 then 
  	    ak.ProTrackingConfirmed("haemophilia") 
  	 	end
			ak.bleeding = pushed -- More Bleeding
		elseif ak.bleeding - pushed > 100 then
			--ak.bleeding = pushed --Less Bleeding
			if ak.thoughtIhad and affstrack.score.haemophilia > 0 and not ak.dontremovehaemo then
				ak.thoughtIhad("haemophilia")	
			end
		elseif ak.bleeding > 100 and affstrack.score.haemophilia > 0 and ak.ProTrackingConfirmed and affstrack.score.haemophilia < 100 then 
			ak.ProTrackingConfirmed("haemophilia") 
		end	
	end
	ak.dontremovehaemo = false
end

if ak.bloodletbleed then return end
function ak.bloodletbleed()
	return 255
end


