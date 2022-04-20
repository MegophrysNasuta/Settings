cecho('\n<cyan>Following party target: '.. matches[2] ..'\n')
Megophrys.setTarget(matches[2])

if not Megophrys.autoAttacking and target ~= 'none' then
  Megophrys.autoAttack()
end
