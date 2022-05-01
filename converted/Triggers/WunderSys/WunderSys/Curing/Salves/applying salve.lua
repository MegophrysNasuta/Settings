local applied = string.lower(multimatches[2][2])
if applied ~= "quicksilver" and applied ~= "sileris" then
  wsys.applying = applied
end
if applied == "density" then
  deleteFull()
elseif wsys.settings.gagcuring then
  deleteLine()
end
