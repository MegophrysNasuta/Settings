if matches[2] == 'dirpad' then
  if matches[3] == 'show' then DirPad:show() else DirPad:hide() end
elseif matches[2] == 'hpbars' then
  if matches[3] == 'show' then
    Megophrys.hpGauge:show()
    Megophrys.mpGauge:show()
  else
    Megophrys.hpGauge:hide()
    Megophrys.mpGauge:hide()
  end
end
