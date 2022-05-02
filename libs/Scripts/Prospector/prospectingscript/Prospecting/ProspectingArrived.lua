-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------

LodeList = {}


function ProspectingArrived()

	if ProspectList[1] and prospecting == 1 then
		table.remove(ProspectList,1)
		if ProspectList[1] then 
			prospectingtimer = tempTimer(0.8, [[mmp.gotoRoom(ProspectList[1])]]) 
		else 
			echo("Area fully explored!")
			prospecting=0
		end
	send("prospect") 
	send("read sign")
	end


end
