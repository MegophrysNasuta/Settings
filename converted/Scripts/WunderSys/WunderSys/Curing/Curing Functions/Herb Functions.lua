wsys.lastherb = "nothing"

function wsys.ate(herb)
 --ginger level handling
 --[[if (herb == "ginger" or herb == "antimony") and (wsys.lastherb == "ginger" or wsys.lastherb == "antimony") then
  --check if ginger was eaten quick enough
  if wsys.timeElapsed(wsys.times.bals.lost.herb) < 2300 then
   cecho(" <deep_pink>GINGER LEVEL +1!")
   wsys.gingerlevel = math.min(wsys.gingerlevel + 1, 10)
  else
   cecho(" <deep_pink>GINGER LEVEL RESET!")
   wsys.gingerlevel = 1
  end
 else]]
  --TODO: Per announce 4313, ginger additional curing is blocked by the alchemist being in the room
  --      For now, just assume it always only cures one level.
  wsys.gingerlevel = 1
 --end
 wsys.lastherb = herb
 wsys.atesub(herb) 
 wsys.cure = herb
 wsys.eating = false
 if not wsys.aff.homunculusmercury then
  wsys.lostBal("herb", 1.9)
 else
  wsys.lostBal("herb", 2.9)
 end
end -- func

function wsys.emptyherb()
 if wsys.cure == "cohosh" or wsys.cure == "gypsum" then
  wsys.def.insomnia = true
 elseif wsys.cure ~= "hawthorn" and wsys.cure ~= "calamine" then
  for k,v in pairs(wsys.tb.cures[wsys.cure]) do
    wsys.predicted[v] = nil
	
    if wsysf.affs[v] then
      wsysf.core.debug.print(2, "Empty herb eat should clear ".. v.."?")
    end
   disableTrigger(string.title(v) .. " -")
  end -- for
 end -- if
 wsys.pairscheck(wsys.cure)
 wsys.cure = nil
end -- if


function wsys.herbbal()
 if not wsys.bals.herb and not wsys.lifevision then
  wsys.gotBal("herb")
  wsys.herbbalsub()
 end -- if
end -- func


function wsys.herbballoss()
 if wsys.aff.blackout then
  wsys.ate(wsys.eating)
  do return end
 end -- if
end -- func

