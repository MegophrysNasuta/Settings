function ak.cure.focus(whom)
	ak.occie.aura.parsereduct("focus")
   local affs = {}
   ocured = ocured or {}
   ocured.focused = {}
   ak.randomaffs = ak.randomaffs or 0
   affstrack.score.rixil = 0
   if affstrack.score.impatience>0 then 
      if ak.thoughtIhad then ak.thoughtIhad("impatience") else affstrack.score.impatience = 0 end
      ocured = ocured or {}
      ocured.focused = {}  
   end
   for i = 1, #affstrack.focused  do
      if affstrack.score[affstrack.focused[i]] > 0 then
         table.insert(affs, affstrack.focused[i])
      end
   end
   if #affs == 1 and affstrack.score[affs[1]] < 100 and ak.randomaffs == 0 then
      if ak.ProTrackingConfirmed then ak.ProTrackingConfirmed(affs[1]) end
      affstrack.score[affs[1]] = 0
			ak.AfflictionCured(affs[1])
			ak.ResetConfirmAff(affs[1])
	 elseif #affs == 1 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      ocured.focused[affs[1]] = affstrack.score[affs[1]]
      affstrack.score[affs[1]] = 0
			ak.AfflictionCured(affs[1])
			ak.ResetConfirmAff(affs[1])
   elseif #affs > 0 then
      ak.echoForPossibleCures(table.concat(affs, " "))
      for i = 1, #affs do
         ocured.focused[affs[i]] = affstrack.score[affs[i]]
         affstrack.score[affs[i]] = affstrack.score[affs[i]] - affstrack.score[affs[i]] / #affs
         if affstrack.score[affs[i]] < ak.errorallowance then
            affstrack.score[affs[i]] = 0
						ak.AfflictionCured(affs[i])
         end
      end
   elseif ak.randomaffs > 0 then
      ak.randomaffs = ak.randomaffs - 1
   else
      if ak.WhyYouDoThat then ak.WhyYouDoThat("focused") end
   end
   ak.scoreup(target)
end




