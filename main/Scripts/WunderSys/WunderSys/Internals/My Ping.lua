local pingList = pingList or {}

--return my ping
function wsys.myPing()
  return wsys.averageListResult(pingList)
end

function wsys.addPing()
  table.insert(pingList, 1, getNetworkLatency())
  if #pingList > 10 then
    table.remove(pingList, 11)
  end
end

function wsys.averageListResult(l)
  local i = #l
  local acc = 0
  for k,v in pairs(l) do
    acc = acc + v
  end --for
  return acc / i
end

registerAnonymousEventHandler("sysDataSendRequest", "wsys.addPing")
