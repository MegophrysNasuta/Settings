if ak.ai() then return end
if IsTargetted(matches[2]) then
   local nohave = matches[3]
   if nohave == "paralyse" then nohave = "paralysis" end  
   if nohave == "plague" then nohave = "voyria" end
   if nohave == "clumsy" then nohave = "clumsiness" end
   if nohave == "dizzy" then nohave = "dizziness" end
   if nohave == "stupid" then nohave = "stupidity" end
   if ak.thoughtIhad then ak.thoughtIhad(nohave) else affstrack.score[nohave] = 0 end
end
