
if ak.defaultstack then return end --Delete Me From Personal Settings!

function ak.defaultstack()
   if gmcp.Char.Status.race:match("Dragon") then 
      ak.stack = "dragon" 
      affstrack.crushedherb = nil
   elseif gmcp.Char.Status.class == "Monk" then
      if ak.monk.toggleswap then
         ak.monk.toggleswap() 
      else
         ak.stack = "mindfuck"
      end
   elseif gmcp.Char.Status.class == "Magi" then
      ak.stack = "Dgmagi"
      --ak.stack = "Pmagi"
   elseif gmcp.Char.Status.class == "Serpent" then
      ak.stack = "Kelp"
   elseif gmcp.Char.Status.class == "Occultist" then
      ak.stack = "Unravel"
   elseif gmcp.Char.Status.class == "Jester" then
      ak.stack = "JesterNoFash"
   elseif gmcp.Char.Status.class == "Shaman" then 
      ak.stack = "Tzantza" 
   elseif gmcp.Char.Status.class == "Sylvan" then
      ak.stack = "Weathering"
   elseif gmcp.Char.Status.class == "Bard" then
      ak.stack = "Kelp"
   elseif gmcp.Char.Status.class == "Blademaster" then
      ak.stack = "BM Prep"
   elseif gmcp.Char.Status.class == "Priest" then
      ak.stack = "priesto"
   elseif gmcp.Char.Status.class == "Alchemist" then
      ak.stack = "alchbase"
	 elseif gmcp.Char.Status.class == "Apostate" then
	 		ak.stack = "Kelp"
   elseif gmcp.Char.Status.class == "Sentinel" then
      ak.stack = "Petrify"
   elseif gmcp.Char.Status.class == "Depthswalker" then
      ak.stack = "Damage"
   elseif gmcp.Char.Status.class == "Psion" then
      ak.stack = "PsiLock"			
	 elseif gmcp.Char.Status.class == "air Elemental Lord" then
	    ak.stack = "Duress"
	 elseif gmcp.Char.Status.class == "water Elemental Lord" then
	    ak.stack = "Perversion"
	 elseif gmcp.Char.Status.class == "fire ELemental Lord" then
	 	  ak.stack = "Ignition"
   elseif gmcp.Char.Status.class == "Infernal" or gmcp.Char.Status.class == "Paladin" or gmcp.Char.Status.class == "Runewarden" then   
      if gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] == "Spec: Dual Cutting" then
         if ak.dwcoffensetoggle then
            ak.dwcoffensetoggle()
         end
      elseif gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] and gmcp.Char.Vitals.charstats[3] == "Spec: Sword and Shield" then
         ak.stack = "Aboard"     --sword and board
      elseif gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] and gmcp.Char.Vitals.charstats[3] == "Spec: Two Handed" then
         ak.stack = "2hspeed" 
      elseif gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[3] and gmcp.Char.Vitals.charstats[3] == "Spec: Dual Blunt" then
         ak.stack = "dwb"
      end
   end
end
