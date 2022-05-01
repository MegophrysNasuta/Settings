--throws you off focus bal if you had it
if wsys.bals.focus then
 wsys.lostBal("focus", 2.6)
end
if not wsys.aff.dizziness then
  wsys.affadd("dizziness", "swordandboard")
elseif not wsys.aff.recklessness then
  wsys.affadd("recklessness", "swordandboard")
elseif not wsys.aff.stupidity then
  wsys.affadd("stupidity", "swordandboard")
elseif not wsys.aff.confusion then
  wsys.affadd("confusion", "swordandboard")
elseif not wsys.aff.epilepsy then
  wsys.affadd("epilepsy", "swordandboard")
end
