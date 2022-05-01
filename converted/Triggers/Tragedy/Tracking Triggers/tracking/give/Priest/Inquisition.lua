if isTarget(matches[2]) then
	Tragedy.noshowAdd("inquisition")
  realContemplate = true
end

if announce then
  send("PT Inquisition on " ..target)
end

tempTimer(18, [[Tragedy.curedaff("inquisition")]])
tempTimer(19, [[report("Inquisition fading!")]])


