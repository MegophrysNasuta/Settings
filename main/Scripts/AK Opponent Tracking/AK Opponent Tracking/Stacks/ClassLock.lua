function ak.dragonfied(affline)
	if not ak.dragonTarget then
		ak.dragonTarget = true
		ak.classlockadd()
		parsedclasscures = false
		ak.scoreup(target)
		cecho("\n<cyan>Target is <yellow>DTF")
	end
end

function ak.elementalfied(what)
	if not ak.elementalTarget then
		ak.elementalTarget = what
		ak.dragonTarget = false
		ak.classlockadd()
		parsedclasscures = false
		ak.scoreup(target)
		cecho("\n<cyan>Target is <yellow>DTF("..what..")")
	end
end

function ak.classlockadd()
   if ndba and wsys then
      ak.classlockwsys()
   elseif svo and ndb then
      ak.classlocksvo()
	 else 
	    classlock = {}
      table.insert( classlock, "voyria" )
      table.insert( classlock, "weariness" )
      table.insert( classlock, "reckless" )
   end
end

function ak.classlockwsys()
 classlock = {}
 if ak.elementalTarget then
 	if ak.elementalTarget == "Earth" then
		table.insert( classlock, "weariness" )	
	elseif ak.elementalTarget == "Air" then
		table.insert( classlock, "voyria" )	
	elseif ak.elementalTarget == "Water" then
		table.insert( classlock, "weariness" )		
	elseif ak.elementalTarget == "Fire" then
		table.insert( classlock, "weariness" )
	end 
 elseif ak.dragonTarget then
   table.insert( classlock, "weariness" )
   table.insert( classlock, "recklessness" )
 elseif ndba.isperson(target) and ndba.getclass(target) ~= "unknown" then
   if ndba.getclass(target) == "Alchemist" then    --
      table.insert( classlock, "stupidity" )
   elseif ndba.getclass(target) == "Apostate" then --
      table.insert( classlock, "voyria")
   elseif ndba.getclass(target) == "Bard" then
      table.insert( classlock, "voyria" )
	 elseif ndba.getclass(target) == "Blademaster" then
      table.insert( classlock, "paralysis" )
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndba.getclass(target) == "Druid" then    --
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndba.getclass(target) == "Infernal" then
      table.insert( classlock, "weariness" )
   elseif ndba.getclass(target) == "Jester" then   --
      table.insert( classlock, "voyria" )
   elseif ndba.getclass(target) == "Magi" then
      table.insert( classlock, "haemophilia" )
   elseif ndba.getclass(target) == "Monk" then
      table.insert( classlock, "weariness" )
   elseif ndba.getclass(target) == "Occultist" then   --
      table.insert( classlock, "paralysis" )
      table.insert( classlock, "voyria" )
   elseif ndba.getclass(target) == "Paladin" then  
      table.insert( classlock, "weariness" )
      table.insert( classlock, "voyria" )
   elseif ndba.getclass(target) == "Priest" then   --
      table.insert( classlock, "weariness" )
      table.insert( classlock, "voyria" )
   elseif ndba.getclass(target) == "Runewarden" then
      table.insert( classlock, "weariness" )
      table.insert( classlock, "voyria")
   elseif ndba.getclass(target) == "Sentinel" then   
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndba.getclass(target) == "Serpent" then   
      table.insert( classlock, "weariness" )
   elseif ndba.getclass(target) == "Shaman" then   --
      table.insert( classlock, "selarnia" )
   elseif ndba.getclass(target) == "Sylvan" then   --
      table.insert( classlock, "voyria" )
   elseif ndba.getclass(target) == "Depthswalker" then   --
      table.insert( classlock, "recklessness" )
   elseif ndba.getclass(target) == "Psion" then   --
      table.insert( classlock, "confusion" )
   end
 else
    table.insert( classlock, "voyria" )
    table.insert( classlock, "weariness" )
    table.insert( classlock, "reckless" )
 end
end

function ak.classlocksvo()
 classlock = {}
 if ak.dragonTarget then
   table.insert( classlock, "weariness" )
   table.insert( classlock, "recklessness" )
 elseif ndb.isperson(target) and ndb.getclass(target) ~= "unknown" then
   if ndb.getclass(target) == "Alchemist" then    --
      table.insert( classlock, "stupidity" )
   elseif ndb.getclass(target) == "Apostate" then --
      table.insert( classlock, "voyria")
   elseif ndb.getclass(target) == "Bard" then
      table.insert( classlock, "voyria" )
	 elseif ndb.getclass(target) == "Blademaster" then
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndb.getclass(target) == "Druid" then    --
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndb.getclass(target) == "Infernal" then
      table.insert( classlock, "weariness" )
   elseif ndb.getclass(target) == "Jester" then   --
      table.insert( classlock, "voyria" )
   elseif ndb.getclass(target) == "Magi" then
      table.insert( classlock, "haemophilia" )
   elseif ndb.getclass(target) == "Monk" then
      table.insert( classlock, "weariness" )
   elseif ndb.getclass(target) == "Occultist" then   --
      table.insert( classlock, "paralysis" )
      table.insert( classlock, "voyria" )
   elseif ndb.getclass(target) == "Paladin" then  
      table.insert( classlock, "weariness" )
      table.insert( classlock, "voyria" )
   elseif ndb.getclass(target) == "Priest" then   --
      table.insert( classlock, "voyria" )
   elseif ndb.getclass(target) == "Runewarden" then
      table.insert( classlock, "weariness" )
      table.insert( classlock, "voyria")
   elseif ndb.getclass(target) == "Sentinel" then   
      table.insert( classlock, "weariness" )
		  table.insert( classlock, "prone" )
   elseif ndb.getclass(target) == "Serpent" then   
      table.insert( classlock, "weariness" )
   elseif ndb.getclass(target) == "Shaman" then   --
      table.insert( classlock, "selarnia" )
   elseif ndb.getclass(target) == "Sylvan" then   --
      table.insert( classlock, "voyria" )
   elseif ndb.getclass(target) == "Depthswalker" then   --
      table.insert( classlock, "recklessness" )
   end
 else
    table.insert( classlock, "voyria" )
    table.insert( classlock, "weariness" )
    table.insert( classlock, "reckless" )
 end
end
