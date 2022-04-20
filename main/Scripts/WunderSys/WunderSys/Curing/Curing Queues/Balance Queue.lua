function wsys.balqueue()
if wsys.cancure() and wsys.bals.b and wsys.bals.e then
 if not wsys.tanglecheck() and not wsys.damagedarms() and not wsys.aff.paralysis then
  --parrying
  if wsys.toparry then wsys.parryFunction() end

  --transmuting for monks
  if wsys.isClass("monk") then
   wsys.transmutequeue()
  end -- if transmuting


 end -- if
end
end -- func
