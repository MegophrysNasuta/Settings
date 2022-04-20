local twolower = string.lower(multimatches[2][2])
if twolower == "health" then
  wsys.cure = twolower .. string.lower(multimatches[2][3])
  wsys.lostBal("hm", 6)
else
  wsys.applying = twolower .. string.lower(multimatches[2][3])
end

if wsys.settings.gagcuring then
  deleteLine()
end
