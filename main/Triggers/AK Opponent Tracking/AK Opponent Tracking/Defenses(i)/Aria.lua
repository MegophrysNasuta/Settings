local mehdo = matches[2]
if not _G[mehdo.."ariatimer"] then
	ak.limbs.ariaUp(mehdo)
end
_G[mehdo.."ariatimer"] = tempTimer(5, [[
	cecho("\n\n\n<cyan>Correcting ]] .. mehdo .. [[ aria!\n\n\n")
	ak.limbs.ariaDown(]]..mehdo..[[)
	_G["]] .. mehdo .. [[ariatimer"] = nil   
]])
