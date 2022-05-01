ak.knownmaxhealth = ak.knownmaxhealth or {}
ak.knownmaxhealth[matches[2]] = matches[4] 
falcon = falcon or {}
falcon.areawho = falcon.areawho or {}
if gmcp.Char.Name.name ~= matches[2] then
	table.insert(falcon.areawho,matches[2])
end
if IsTargetted(matches[2]) then 
	falcon.targetin = true
else
	--ak.deleteFull()
end


