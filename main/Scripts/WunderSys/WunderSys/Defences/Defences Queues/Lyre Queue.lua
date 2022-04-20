function wsys.lyrequeue()
 if wsys.uselyre and not wsys.paused and wsys.bals.b and wsys.bals.e and not wsys.aff.aeon and not wsys.def.lyre and not wsys.timer.lyrewait and not wsys.aff.paralysed and not wsys.tanglecheck() and not wsys.damagedarms() and not wsys.aff.prone then
  wsys.checkaffs()
  wsys.lyre()
 end -- if
end -- func
