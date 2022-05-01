local Uaff = matches[3]

if IsTargetted(matches[2]) then
   ak.psion.unweaving[Uaff] = ak.psion.unweaving[Uaff] + 1
   local unweave = "unweaving"..matches[3]
   OppGainedAff(unweave)
	 cecho("\n<cyan>Unweaving "..Uaff.." stacks at <yellow>"..ak.psion.unweaving[Uaff])
end
