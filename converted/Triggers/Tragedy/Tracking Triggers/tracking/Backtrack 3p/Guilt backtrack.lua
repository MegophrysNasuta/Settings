if isTarget(matches[2]) then
  guiltCured = true
  tempTimer(1, [[guiltCured = false]])
end

if isTarget(matches[2]) then
  if tarAff("guilt") then 
    Tragedy.curedaff("guilt")
  end
end

