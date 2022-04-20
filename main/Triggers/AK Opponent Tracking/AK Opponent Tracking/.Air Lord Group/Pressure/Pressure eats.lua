ak = ak or {}
ak.duress = ak.duress or {}

if target == matches[2] and ak.duress.pressure > 0 then
   ak.duress.pressure = ak.duress.pressure - 1
   cecho("\n<cyan>Pressure lvl: <yellow>"..ak.duress.pressure)
	 ak.scoreup(matches[2])
end
