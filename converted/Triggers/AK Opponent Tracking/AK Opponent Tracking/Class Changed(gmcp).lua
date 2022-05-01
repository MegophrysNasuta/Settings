ak.classenable()
if wsys then  
   monkenemy = {}
   if gmcp.Char.Status.class ~= "Monk" or gmcp.Char.Status.race:match("Dragon") then
      wsys.monkstance = false
   end 
   if ndba and gmcp.Char.Status.class ~= "Monk" then 
      enemylist = enemylist or {}
      if #enemylist > 0 then
         for i = 1, #enemylist do
            if ndba.isashtani(enemylist[i]) then
               send("unenemy "..enemylist[i])
               table.insert(monkenemy, enemylist[i])
            end   
         end
      end
   end
end
enableTrigger("Trait Gag Out")
send("trait list known")
disableTrigger("Class Changed(gmcp)")
enableTrigger("Class Changed Prompt Lock")

