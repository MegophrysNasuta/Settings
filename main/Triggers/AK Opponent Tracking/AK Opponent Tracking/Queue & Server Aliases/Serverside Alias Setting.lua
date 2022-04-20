if matches[2] == "dor" then return end
affstrack.overcharge = false

local cursedraw = matches[3]:lower()
cursedraw = string.gsub(cursedraw, "/", " ")

cursedraw = cursedraw:split(" ")
for k,v in pairs(cursedraw) do
   if string.findPattern(cursedraw[k],"overcharge") then
      affstrack.overcharge = true
   elseif string.findPattern(cursedraw[k],"relapse") then
      invoked = cursedraw[k+1]
   elseif string.findPattern(cursedraw[k],"invoke") then
      invoked = cursedraw[k+2]
   elseif string.findPattern(cursedraw[k],"impurity") then
      nextcurse = cursedraw[k+1]
   elseif string.findPattern(cursedraw[k],"instill") then
      nextinstill = cursedraw[k+3]
   elseif string.findPattern(cursedraw[k],"moon") then
      nextmoon = cursedraw[k+3]
   elseif string.findPattern(cursedraw[k],"deadeyes") then
      nextcurse = cursedraw[k+2]
      nextcurse2 = cursedraw[k+3]
   elseif string.findPattern(cursedraw[k],"imbibe") then
      imbibedraw = cursedraw[k+1]
   elseif string.findPattern(cursedraw[k],"truewrack") then
      alchemisttruewrack = cursedraw[k+2]
      alchemisttruewracktwo = cursedraw[k+3]
	 elseif string.findPattern(cursedraw[k],"wrack") then
      alchemistwrack = cursedraw[k+2]
   end
end
if table.contains(cursedraw,"combo") and ak.MonkType() ~= "Tekura" then
	ak.shikudo.AliasSplit(cursedraw)
end





	

