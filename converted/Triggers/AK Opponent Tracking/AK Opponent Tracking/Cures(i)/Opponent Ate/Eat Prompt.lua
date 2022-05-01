--BREAK IS HERE
if not ak.currenteat then
  return
end
deleteLine()
if opponenteat == 1 then
  if timerherb == 1 then
    cecho("<cyan>-Ignored Cures")
  end
  if timerherb == 0 then
    cecho("<cyan>Something is Fucked")
    opponenteat = 0
  end
end
if opponenteat == 0 then
  opponenteat = 1
  timerherb = 1
  herbtimer = tempTimer(.7, [[opponenteat = 0;timerherb = 0]])
  opponentrecenteat = true
  herbtimerrecenteat = tempTimer(.5, [[opponentrecenteat = false;ak.serveraliases()]])
  ak.cure.ate(ak.currenteat, false)
end
ak.currenteat = false
ak.showPrompt()
setTriggerStayOpen("Opponent Ate", 0)
