function wsys.clotqueue()
 if wsys.cancure() and wsys.bleeding > 30 and not wsys.aff.haemophilia and not wsys.settings.stopclot then
  if wsys.bleedtype == "health" then
   if (wsys.stats.m>wsys.manathreshold()) and wsys.stats.m > 500 then
    wsys.clot()
   end
  elseif wsys.bleedtype == "mana" then
   if wsys.stats.h > (wsys.stats.maxh * 0.75) then
   --if we're off moss and sip bal (health prio on that) then stop at 75% hp, otherwise go to 60%
    wsys.clot()
   elseif wsys.bals.moss and (wsys.stats.h <= (wsys.stats.maxh *.70)) then
    --got moss bal, so can clot more health away
    wsys.clot()
   elseif wsys.bals.hm and (wsys.stats.h <= (wsys.stats.maxh *.65)) then
    --got health elixir bal, so can clot more health away
    wsys.clot()
   end
  end --if
 end -- if
end -- func
