if IsTargetted(multimatches[2][2]) then
	if not multimatches[3][1]:find("stiffens into paralysis.") then
		ak.instill("Degeneration")
	end
end

--Weariness, Clumsiness, Paralysis, Damage
--[[
if IsTargetted(matches[2]) and (ak.boostloop or affstrack.score.timeloop >= 50) then 
   OppGainedAff("weariness")
   OppGainedAff("clumsiness") 
elseif IsTargetted(matches[2]) then 
   if affstrack.score.weariness == 0 then
      OppGainedAff("weariness")
   elseif affstrack.score.clumsiness == 0 and affstrack.score.weariness == 100 then
      OppGainedAff("clumsiness") 
   end
   ak.paradegen = true
end
--]]
