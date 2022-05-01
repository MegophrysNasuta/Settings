if ak.ai() then return end
if IsTargetted(matches[2]) then
   if affstrack.score.torso == 0 then
	    ak.limbs.limbcount[target]["torso"] = 0
	    affstrack.score.torso = 100
	 end
   local aff = "wrenchtorso"
   OppGainedAff(aff)
end
