if ak.ai() then return end
local checks = {
	["choke"] = {[1] = "weariness",[2] = "nausea"},
	["roil"] = {[1] = "weariness",[2] = "asthma"},
	["parch"] = {[1] = "weariness",[2] = "haemophilia"},
	["drench"] = {[1] = "asthma",[2] = "slickness",[3] = "anorexia"},
}
if ak.fluxline and ak.fluxline == matches[1] then return end
ak.fluxcheck = ak.fluxcheck or "unknown"
if not table.contains(checks, ak.fluxcheck) then
	disableTrigger("Flux Enhance")
	return 
end
--cecho("<cyan>Non-Flux: <white>"..ak.fluxcheck)
if ak.fluxcheck == "drench" then

else
	if affstrack.score[checks[ak.fluxcheck][1]] == 100 and affstrack.score[checks[ak.fluxcheck][2]] < 100 then
		--cecho("<cyan>\nCheck Flux: <white>"..checks[ak.fluxcheck][2])
		ak.thoughtIhad(checks[ak.fluxcheck][2])
	elseif affstrack.score[checks[ak.fluxcheck][1]] < 100 and affstrack.score[checks[ak.fluxcheck][2]] == 100 then
		--cecho("<cyan>\nCheck Flux: <white>"..checks[ak.fluxcheck][1])
		ak.thoughtIhad(checks[ak.fluxcheck][1])
	else
	
	end	
end
disableTrigger("Flux Enhance")
