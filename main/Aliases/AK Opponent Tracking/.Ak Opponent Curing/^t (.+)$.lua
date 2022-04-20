target = matches[2] 
ak.highlighttarget = ak.highlighttarget or true --Change This To False if Errors
if ak.highlighttarget == true then
   if idtwo then killTrigger(idtwo) end
   idtwo = tempTrigger(target, [[selectString("]] .. target .. [[", 1) fg("red") resetFormat()]])
   target = target:title()
   if id then killTrigger(id) end
   id = tempTrigger(target, [[selectString("]] .. target .. [[", 1) fg("red") resetFormat()]])
else 
   target = target:title()
end
if ak.stack and ak.stack == "none" then ak.classenable() end
echo("\n")
cecho("<cyan> Target Changed to "..target)
echo("\n")
echo("\n")
ak.oresetparse()



--If your targetting errors, try setting ak.highlighttarget to false
