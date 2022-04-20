if matches[2] == 'l' then 
  Megophrys.targetLimb = 'left' 
elseif matches[2] == 'r' then
  Megophrys.targetLimb = 'right'
else
  Megophrys.targetLimb = ''
end
cecho('\n<cyan>Target limb set to: '.. (Megophrys.targetLimb or 'none') ..'\n')
