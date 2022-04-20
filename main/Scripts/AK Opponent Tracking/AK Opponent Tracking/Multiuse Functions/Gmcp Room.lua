function ak.roomupdate()
	 ak.MountLook()
	 ak.RoomDefs()
   if gmcp.Room.Info.num ~= ak.lastroom then
	 		if wsys and wsys.retard then
				wsys.retardationOff()
			end
      ak.ae = ak.ae or 0
      ak.blocked = nil
      if ak.disturbed or ak.ae > 0 or ak.feedback then
         ak.disturbed = false
         ak.ae = 0
         ak.feedback = false
         ak.scoreup(target)
      end
      if ak.infernohere then 
         ak.infernohere = false
         ak.scoreup(target)
      end
   end
   ak.lastroom = gmcp.Room.Info.num
end

registerAnonymousEventHandler("gmcp.Room.Info", "ak.roomupdate")

