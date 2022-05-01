function wsys.spiritdisruptGained(event, affliction, class)
  if event == "got aff" then
    if affliction == "spiritdisrupt" then
      --send("curing focus off")
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.spiritdisruptGained")

function wsys.spiritdisruptLost(event, affliction)
  if event == "lost aff" then
    if affliction == "spiritdisrupt" then
      --send("curing focus on")
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.spiritdisruptLost")
