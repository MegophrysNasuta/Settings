function wsys.fitness()
 enableTrigger("Fitness")
 if wsys.timer.fitnesswait then
   killTimer(tostring(wsys.timer.fitnesswait))
 end
 wsys.timer.fitnesswait = tempTimer(5, [[wsys.timer.fitnesswait = nil;disableTrigger("Fitness");wsys.addqueue("lock")]])
 wsys.doOnce("fitness", 5 )
end -- func


function wsys.fitnessd()
 if wsys.timer.fitnesswait then
  disableTrigger("Fitness")
  if wsys.timer.fitnesswait then
   killTimer(tostring(wsys.timer.fitnesswait))
  end
  wsys.timer.fitnesswait = nil
  wsys.cure = "fitness"
  wsys.affcured("asthma")
  wsys.cure = nil
  wsys.lostBal("fitness", 10)
 end -- if
 if wsys.timer.reactivatecuring then 
  killTimer(wsys.timer.reactivatecuring)
  wsys.timer.reactivatecuring = nil
  send("curing on")
 end
end -- func

function wsys.aeonfitness()
 enableTrigger("Fitness")
 if wsys.timer.fitnesswait then
   killTimer(tostring(wsys.timer.fitnesswait))
 end
 wsys.timer.fitnesswait = tempTimer(1 + wsys.myPing()*1.5, [[wsys.timer.fitnesswait = nil;disableTrigger("Fitness")]])
 wsys.salviaSend("fitness on")
end

function wsys.failedfitness()
  if wsys.timer.fitnesswait then
    killTimer(tostring(wsys.timer.fitnesswait))
    wsys.timer.fitnesswait = nil
    wsys.cure = nil
    lostBal("fitness", 1)
  end
end


function wsys.emptyfitness()
 if wsys.timer.fitnesswait then
  disableTrigger("Fitness")
  if wsys.timer.fitnesswait then
   killTimer(tostring(wsys.timer.fitnesswait))
   wsys.timer.fitnesswait = nil
  end
  wsys.aff.asthma = nil
  disableTrigger("Asthma -")
  wsys.pairscheck("fitness")
 end -- if
end -- func

