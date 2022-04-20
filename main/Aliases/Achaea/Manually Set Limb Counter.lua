cecho('\n<cyan>Setting target '.. matches[2] ..' to '.. matches[3] ..'%\n')
lb[target].hits[matches[2]] = tonumber(matches[3])
Megophrys.updatePrepGauges()
