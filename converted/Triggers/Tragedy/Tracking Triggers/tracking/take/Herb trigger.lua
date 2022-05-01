
if isTarget(matches[2]) then
	if not illusion then
  	if herbConversion[matches[3]] == "hawthorn" then
  		Tragedy.curedaff("undeaf")
  	elseif herbConversion[matches[3]] == "bayberry" then
  		Tragedy.curedaff("unblind")
    elseif herbConversion[matches[3]] == "lobelia" then
      
  	else
  		Tragedy.Cure(herbConversion[matches[3]])
  	end
	end
end

if isTarget(matches[2]) then
  if not illusion then
    if tarAff("anorexia") then
      backtrack2("anorexia")
    end
  end
end
