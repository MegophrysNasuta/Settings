local combodraw = multimatches[2][2]:lower()
if not string.findPattern(combodraw,"hfp") and not string.findPattern(combodraw,"snk") and not string.findPattern(combodraw,"spp") and not string.findPattern(combodraw,"mnk") and not string.findPattern(combodraw,"drawslash") then
	return
end
combodraw = string.gsub(combodraw, "|", " ")
combodraw = combodraw:split(" ")
ak.limbs.parriedlimbs = {}
for i = 1, #combodraw do
   if string.findPattern(combodraw[i],"hfp") then
      table.insert(ak.limbs.parriedlimbs,combodraw[i+1]:lower().."leg")
   elseif string.findPattern(combodraw[i],"snk") then
      table.insert(ak.limbs.parriedlimbs,combodraw[i+1]:lower().."leg")
   elseif string.findPattern(combodraw[i],"spp") then
      table.insert(ak.limbs.parriedlimbs,combodraw[i+1]:lower().."arm")
   elseif string.findPattern(combodraw[i],"mnk") then
      table.insert(ak.limbs.parriedlimbs,combodraw[i+1]:lower().."arm")
	 elseif string.findPattern(combodraw[i],"drawslash") then
      table.insert(ak.limbs.parriedlimbs,combodraw[i+2]:lower().."arm")
   end 
end
ak.monkcombodraw = combodraw
