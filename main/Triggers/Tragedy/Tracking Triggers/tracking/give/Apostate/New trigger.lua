if gmcp.Char.Status.class == "Apostate" then
  if isTarget(matches[2]) then 
    if canAdd then
      Tragedy.noshowAdd(ven1)
      Tragedy.noshowAdd(ven2)
      canAdd = false
      tempTimer(1, [[canAdd = true]])
    end
  end
end
  
