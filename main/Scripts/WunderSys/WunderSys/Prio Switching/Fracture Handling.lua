function wsys.fracturetree(event, affliction)
  if wsys.fracturecount() > 2 and not wsys.bals.hm and wsys.treeAffs() == 0 and (not wsys.aff.paralysis and wsys.bals.tree) and not wsys.timer.treewait then
    wsys.tree()
  end
end

registerAnonymousEventHandler("got aff", "wsys.fracturetree")
registerAnonymousEventHandler("lost aff", "wsys.fracturetree")
