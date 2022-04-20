if not falcon.targetin then
	ak.deleteFull()
end
disableTrigger("Falcon Observe Capture")
if ndba and #falcon.areawho > 0 then
	--cecho("<cyan>"..ndba.concatand(falcon.areawho).." are in " .. gmcp.Room.Info.area) 
	send("pt "..ndba.concatand(falcon.areawho).." are in " .. gmcp.Room.Info.area) 
end

