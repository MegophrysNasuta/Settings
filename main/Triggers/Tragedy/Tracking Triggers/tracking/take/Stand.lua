if isTarget(matches[2]) and not illusion then 
	Tragedy.curedaff("prone")
	if lastcured.bloodroot == "slickness" and tarAff("paralysis") then
		Tragedy.curedaff("paralysis")
		Tragedy.noshowAdd("slickness")
	end
end
