ak = ak or {}
ak.duress = ak.duress or {}
ak.duress.pressurescore = affstrack.score.disloyalty + affstrack.score.manaleech + affstrack.score.deadening

if ak.duress.pressurescore < 200  then
   ak.duress.pressure = ak.duress.pressure + 1
else
   ak.duress.pressure = ak.duress.pressure + 2
end
ak.scoreup(matches[2])
cecho("\n<cyan>Pressure lvl: <yellow>"..ak.duress.pressure)
