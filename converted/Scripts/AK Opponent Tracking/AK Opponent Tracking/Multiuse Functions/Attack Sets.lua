--setattack
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.serveraliases()
   if ak.debug then cecho("\nScoring Up") end
   ak.stack = ak.stack or "none"
   if ak.stack == "NoOne" then --Deliverance! 
      ak.aliasreset()
   elseif gmcp.Char.Status.race:match("Dragon") and not inlyre() then                                                                                           -- Dragon --
     	if ak.dragon.setattacks then
				ak.dragon.setattacks()
			end
   elseif gmcp.Char.Status.class == "Occultist" and not inlyre() then
      if ak.occie.setattacks then
				ak.occie.setattacks()
			end
   elseif gmcp.Char.Status.class == "Monk" and not inlyre() then
      if ak.monk.setattacks then
				ak.monk.setattacks()
			end
   elseif gmcp.Char.Status.class == "Magi" and not inlyre() then 
      if ak.magi.setattacks then
				ak.magi.setattacks()
			end
   elseif gmcp.Char.Status.class == "Serpent" and not inlyre() then   
      if ak.serpent.setattacks then
				ak.serpent.setattacks()
			end  
   elseif gmcp.Char.Status.class == "Sentinel" and not inlyre() then
      if ak.sentinel.setattacks then
				ak.sentinel.setattacks()
			end
   elseif gmcp.Char.Status.class == "Shaman" and not inlyre() and not ak.tza then  
      if ak.shaman.setattacks then
			   ak.shaman.setattacks()
			end
   elseif gmcp.Char.Status.class == "Priest" and not inlyre() then 
      if ak.priest.setattacks then
				ak.priest.setattacks()
			end
   elseif gmcp.Char.Status.class == "Apostate" and not inlyre() then                                                                                            -- APOSTATE --
      if ak.apostate.setattacks then
				ak.apostate.setattacks()
			end
   elseif (gmcp.Char.Status.class == "Infernal" or gmcp.Char.Status.class == "Paladin" or gmcp.Char.Status.class == "Runewarden")  and not inlyre() then
			if ak.knight.setattacks then
				ak.knight.setattacks()
			end
   elseif gmcp.Char.Status.class == "Blademaster" and not inlyre() then   
      if ak.bm.setattacks then
				ak.bm.setattacks()
			end
   elseif gmcp.Char.Status.class == "Alchemist" and not inlyre() then
	    if ak.alchemist.setattacks then
				ak.alchemist.setattacks()
			end
   elseif gmcp.Char.Status.class == "Jester" and not inlyre() then
      if ak.stack == "JesterNoFash" and ak.jester.NoFashion then
         ak.jester.NoFashion()
      end
   elseif gmcp.Char.Status.class == "Depthswalker" and not inlyre() then
      if ak.depthswalker.setattacks then
				ak.depthswalker.setattacks()
			end
   elseif gmcp.Char.Status.class == "Sylvan" and not inlyre() then
      if ak.stack == "Weathering" and ak.sylvan.Weather then
         ak.sylvan.Weather()
      end
   elseif gmcp.Char.Status.class == "Psion" and not inlyre() then
			if ak.psion.setattacks then
         ak.psion.setattacks()
      end
   elseif gmcp.Char.Status.class == "Bard" and not inlyre() then
      if ak.stack == "Kelp" and ak.bard.KelpLock and ak.bard.KelpLock.Main then
         ak.bard.KelpLock.Main()
			elseif ak.stack == "Mentals" and ak.bard.Mentals and ak.bard.Mentals.Main then
			   ak.bard.Mentals.Main()
      end
	 elseif gmcp.Char.Status.class == "fire Elemental Lord" and not inlyre() then
	 	  if ak.ignition.setattacks then
         ak.ignition.setattacks()
			end
   elseif gmcp.Char.Status.class == "air Elemental Lord" and not inlyre() then
      if ak.stack == "Duress" and ak.duress and ak.duress.compress then
         ak.duress.compression()
      end
	 elseif gmcp.Char.Status.class == "water Elemental Lord" and not inlyre() then
      if ak.pervasion.setattacks then
        ak.pervasion.setattacks()
      end
   end
   if not inlyre() then
      ak.mycustomoffense()
   end
	 if ak.reboundPop and ak.stack ~= "NoOne" and not inlyre() and not ak.tza then
	 	  ak.reboundPop() 
	 end
end

