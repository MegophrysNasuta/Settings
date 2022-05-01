if matches[3] then
  if matches[3] == 'leg' then
    if matches[2] == 'Right' then
      cecho('\n<cyan>Missing moss or megalith\n')
    else
      cecho('\n<cyan>Missing chameleon or starburst\n')
    end
  else
    if matches[2] == 'Right' then
      cecho('\n<cyan>Missing shield or cloak\n')
    else
      cecho('\n<cyan>Missing web or mindseye\n')
    end
  end
else
  if matches[2] == 'Head' then
    cecho('\n<cyan>Missing crystal or moon\n')
  elseif matches[2] == 'Torso' then
    cecho('\n<cyan>Missing bell or tree\n')
  else -- back
    cecho('\n<cyan>Missing boar or prism\n')
  end
end
