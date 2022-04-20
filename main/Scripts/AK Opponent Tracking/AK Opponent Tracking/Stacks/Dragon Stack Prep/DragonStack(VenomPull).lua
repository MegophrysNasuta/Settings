function ak.dragon.default.venoms()
  vcombo = {}
  if math.random(100)<50 then
    if affstrack.score.paralysis<100 then
        table.insert(vcombo,"curare")
    elseif affstrack.score.crippledarm<100 then
        table.insert(vcombo,"epteth")
    elseif affstrack.score.crippledleg<100 then
        table.insert(vcombo,"epseth")
    elseif affstrack.score.stupidity<100 then
        table.insert(vcombo,"aconite")
    elseif affstrack.score.sensitivity<100 then
        table.insert(vcombo,"prefarar")
    end
  else
    if affstrack.score.stupidity<100 then
        table.insert(vcombo,"aconite")
    elseif affstrack.score.dizziness<100 then
        table.insert(vcombo,"larkspur")
    elseif affstrack.score.clumsiness<100 then
        table.insert(vcombo,"xentio")
    elseif affstrack.score.sensitivity<100 then
        table.insert(vcombo,"prefarar")
    elseif affstrack.score.paralysis<100 then
        table.insert(vcombo,"curare")
    end
  end
end
