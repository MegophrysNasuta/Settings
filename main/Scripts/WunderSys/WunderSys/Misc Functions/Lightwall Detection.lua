wsys.lightwall = false

function wsys.lightwallCheck()
  for k,v in pairs(wsys.roomitems) do
    if v == "a lightwall" then
      wsys.lightwall = true
      return
    end
  end

  --if no lightwall found in gmcp then set it false
  wsys.lightwall = false
end

registerAnonymousEventHandler("roomitems changed", "wsys.lightwallCheck")


