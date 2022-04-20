ak = ak or {}
ak.duress = ak.duress or {}
if target == matches[2] then
  ak.duress.asphyxiate = true
	killTimer(tostring(ak.duress.asphyxiatetimer))
  ak.duress.asphyxiatetimer = tempTimer(10, [[ak.duress.asphyxiate = false]])
	ak.scoreup(matches[2])
end


