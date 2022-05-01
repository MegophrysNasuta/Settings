if string.find(matches[1],"You command your slime") then
  return
elseif string.find(matches[1],"mouth") or string.find(matches[1],"paralysis") then
  if ak.HandleSlime then
    ak.HandleSlime(true)
  end
else
  if ak.HandleSlime then
    ak.HandleSlime(false)
  end
end
