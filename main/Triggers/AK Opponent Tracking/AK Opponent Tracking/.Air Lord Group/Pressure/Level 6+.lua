ak = ak or {}
ak.duress = ak.duress or {}
if ak.duress.pressure < 6 then
   ak.duress.pressure = 6
   ak.scoreup(matches[2])
end
cecho("\n<cyan>Pressure lvl: <yellow>"..ak.duress.pressure)
