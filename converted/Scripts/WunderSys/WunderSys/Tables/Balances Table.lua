-- BALS Table
wsys.bals = {
  b = true, -- balance
  e = true, -- equilibrium

  moss = true,
  hm = true, --rename to sip maybe?
  immunity = true, --7s

  tree = true,
  focus = true,

  salve = true,
  herb = true,
  smoke = true,


  dragonheal = true,
  fool = true,
  voice = true,
  rage = true,
  shrugging = true,
  fitness = true,

}

-- reset all balances
function wsys.resetBals()
  for k in pairs(wsys.bals) do
    wsys.gotBal(k)
  end
end

-- balances are all true on starburst or death
registerAnonymousEventHandler("You Died", "wsys.resetBals")
registerAnonymousEventHandler("You Starbursted", "wsys.resetBals")



