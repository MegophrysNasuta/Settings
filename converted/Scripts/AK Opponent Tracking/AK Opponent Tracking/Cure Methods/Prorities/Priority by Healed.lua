-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
ak.enemyprio = ak.enemyprio or {}
ak.enemyprio.healed = ak.enemyprio.healed or {}
target = target or "Austere"

ak.tieredaffs = {"rightleg 100","rightleg 200","rightleg 300","leftleg 100","leftleg 200","leftleg 300","rightarm 100","rightarm 200","rightarm 300","leftarm 100","leftarm 200","leftarm 300",
                 "head 100","head 200","head 300","torso 100","torso 200","torso 300"}
local ignored = {"rightleg","leftleg","rightarm","leftarm","torso","head","tempslickness"}


function ak.trackPrios(affliction)
	if not affliction or not table.contains(affstrack.score, affliction) then 
		echo("<cyan>SOMETHING IS PUSHING AN UNKNOWN AFF CURED")
		return 
	end
	ak.enemyprio.healed[target] = ak.enemyprio.healed[target] or {}
	local maxinteger = 0
	local fuck = ak.enemyprio.healed[target]
	local aff = affliction
	if table.contains(ignored, aff) then return end
	if table.contains(fuck, aff) then
		table.remove(fuck,table.index_of(fuck, aff))
	end
	if #fuck > 0 then
		for i = 1, #fuck do
			if affstrack.score[fuck[i]] and affstrack.score[fuck[i]] > 0 then
				if affstrack.score[aff] and not table.contains(fuck, aff) then
					table.insert(fuck, i, aff)
					break
				end
			end
		end
	end
	if affstrack.score[aff] and not table.contains(fuck, aff) then
		table.insert(fuck, aff)
	end
	for k,v in pairs(affstrack.score) do
		if v > 0 and not table.contains(fuck, k) and not table.contains(ignored, k) then
			table.insert(fuck, k)
		end
	end
	if ak.debug then
		cecho("enemyhealedprio")
		display(ak.enemyprio.healed[target])
	end
end



function ak.prioSalve(aff)
	local returner = 0
	if not applycure.affoverone then return returner end
	if table.contains(applycure.affoverone, aff) then
	   returner = returner + 100
	   if table.contains(applycure.affovertwo, aff) then
	      returner = returner + 100
	      if table.contains(applycure.affoverthree, aff) then
	         returner = returner + 100
	         if table.contains(applycure.affoverfour, aff) then
	            returner = returner + 100
	            if table.contains(applycure.affoverfive, aff) then
	               returner = returner + 100
	               if table.contains(applycure.affoversix, aff) then
	                  returner = returner + 100
	               end
	            end
	         end
	      end
	   end 
	end
	return returner
end
