if ak.ai() then return end
ak.limbs.ParseonLine()
if IsTargetted(matches[2]) then
   affstrack.score.prone = 100
   if affstrack.score.aflame < 100 then
      affstrack.score.aflame = 100
   end
   if dehydratetimer then 
      killTimer(dehydratetimer)
      dehydratetimer = nil 
   end
   OppGainedAff("dehydrate")
   dehydratetimer = tempTimer(45, [[OppLostAff("dehydrate")]])
end
