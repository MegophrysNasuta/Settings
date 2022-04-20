if wsys.aff.aeon then
  wsys.aeonfailsafe = tempLineTrigger(1, 1, [[if line ~= "You move sluggishly into action." then wsys.affcuredconfirm("aeon") wsys.aeonfailsafe = nil end]])
end
