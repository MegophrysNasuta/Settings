if ak.ai() then return end
if IsTargetted(matches[2]) then
   if affstrack.score.head == 0 then
	    ak.limbs.limbcount[target]["head"] = 0
	    affstrack.score.head = 100
	 end
   local aff = "wrenchhead,epilepsy"
   OppGainedAff(aff)
end
