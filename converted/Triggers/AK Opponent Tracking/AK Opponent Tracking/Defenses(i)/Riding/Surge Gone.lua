if IsTargetted(matches[2]) then
	if ak.ai() then return end
	ak.mounted = false
	OppLostAff("surge")
end
