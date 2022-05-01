ak.deleteFull()
if matches[3] then
   --display(matches[3])
   if matches[3] == "Quick-witted             " then
      ak.balancemodifier = "quickwitted"
   elseif string.find(matches[3],"Nimble") then
      ak.balancemodifier = "nimble"
   elseif string.find(matches[3],"Expert Diagnoser") then
      --ak.expertdiagnose = true
   elseif string.find(matches[3],"Mind Warden") then
      ak.contemplator = true
	 elseif string.find(matches[3],"Health Inspector") then
	    ak.healthinspector = true
   end
end
