function wsys.ragequeue()
 if wsys.settings.haverage and wsys.settings.userage and wsys.cancure() and not wsys.timer.ragewait and wsys.bals.rage and wsys.stats.m > 500 and wsys.stats.w > 100 then
  --use rage if there's one or more bellwort affs
  if wsys.bellwortAffCount() >= 1 then
    wsys.rage()
  end
 end
end -- func


function wsys.bellwortAffCount()
  local count = 0

  if wsys.aff.justice then count = count + 1 end
  if wsys.aff.peace then count = count + 1 end
  if wsys.aff.generosity then count = count + 1 end
  if wsys.aff.lovers then count = count + 1 end
  if wsys.aff.pacified then count = count + 1 end
  if wsys.aff.indifference then count = count + 1 end
  if wsys.aff.retribution then count = count + 1 end
  if wsys.aff.timeloop then count = count + 1 end

  return count
end
