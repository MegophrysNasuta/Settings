local defstrip = matches[2]
--echo(defstrip)
if IsTargetted(matches[3]) then
  if ak.ai() then return end
  if defstrip == "magical shield defence" then
    ak.defs.shield = false
    ak.scoreup(matches[3])
  elseif defstrip == "aura of rebounding defence" then
    ak.defs.reRebounding = true
    ak.defs.rebounding = false
    ak.scoreup(matches[3])
  else
    ak.defs.reRebounding = true
    ak.defs.rebounding = false
    ak.defs.shield = false
    ak.scoreup(matches[3])
  end
end
