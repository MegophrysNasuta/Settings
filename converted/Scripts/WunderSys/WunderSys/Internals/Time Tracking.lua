--time tracking
wsys.times = {
  bals = {
    got = {
    },
    lost = {
    },
  },
}

function wsys.inittimesbals()
 for k,v in pairs(wsys.bals) do
   wsys.times.bals.got[k] = getTime(true, "HH:mm:ss:zzz" )
 end
 for k,v in pairs(wsys.bals) do
   wsys.times.bals.lost[k] = getTime(true, "HH:mm:ss:zzz" )
 end
end

wsys.inittimesbals()
