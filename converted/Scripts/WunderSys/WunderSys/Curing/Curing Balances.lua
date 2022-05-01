--for when you regain a balance
function wsys.gotBal(bal)
  wsys.times.bals.got[bal] = getTime(true, "HH:mm:ss:zzz" )
  wsys.bals[bal] = true
  if wsys.timer[bal.."bal"] then
   killTimer(tostring(wsys.timer[bal.."bal"]))
  end
  wsys.timer[bal.."bal"] = nil
  raiseEvent("got bal", bal)
end

--for when you lose a balance (except balance/equilibrium)
function wsys.lostBal(bal, time)
  wsys.times.bals.lost[bal] = getTime(true, "HH:mm:ss:zzz" )
  local thebal = bal
  wsys.bals[bal] = false
  raiseEvent("lost bal", thebal)
  --set the timer with the 'time' failsafe here
  if wsys.timer[bal.."bal"] then
    killTimer(tostring(wsys.timer[bal.."bal"]))
  end
  wsys.timer[bal.."bal"] = tempTimer(time, function() 
       wsys.times.bals.got[bal] = getTime(true, "HH:mm:ss:zzz" )
		wsys.timer[bal.."bal"] = nil
       wsys.bals[bal] = true
       raiseEvent("got bal", bal)
	end)
end
