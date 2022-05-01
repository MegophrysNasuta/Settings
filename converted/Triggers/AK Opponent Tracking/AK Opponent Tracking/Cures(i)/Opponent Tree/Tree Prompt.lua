if not ak.currenttree then return end
deleteLine()

if opponenttree == 0 then
	opponenttree = 1
  opponenthalftree = 1
  treetimerhalf = tempTimer(8.5, [[opponenthalftree = 0;ak.serveraliases()]])
  treetimer = tempTimer(9.5, [[opponenttree = 0;timertree = 0]])
  timertree = 1
  --cecho("<cyan>Processed Cures")
  ak.cure.tree()
end
if timertree == 0 then
  if opponenttree == 1 then
    opponenttree = 0
    cecho("<cyan>Ignored Cures")
  end
end

ak.currenttree = false
ak.showPrompt()
setTriggerStayOpen("Opponent Tree", 0)
