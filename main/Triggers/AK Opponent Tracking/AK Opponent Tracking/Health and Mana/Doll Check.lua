if IsTargetted(multimatches[2][2]) then 
	ak.currentmana = ak.currentmana - (ak.maxmana/4) 
	ak.knownmaxhealth = ak.knownmaxhealth or {}
  ak.knownmaxhealth[matches[2]] = matches[3] 
	ak.scoreup(multimatches[2][2])
end

