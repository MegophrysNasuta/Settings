Megophrys.setTarget(matches[3])
-- set optional target2, target3
target2 = matches[4] or nil
target3 = matches[5] or nil

if matches[2] ~= "" then
  Megophrys.autoAttack()
end
