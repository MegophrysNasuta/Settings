if matches[2] == "lit" then
  wsys.pipes.nonartiepipes = true
elseif matches[2] == "out" and matches[4] ~= "empty" then
  wsys.pipes.nonartiepipes = true
  wsys.pipes.unlitpipes = true
elseif matches[2] == "out" and matches[4] == "empty" then
  wsys.pipes.nonartiepipes = true
  wsys.pipes.unlitpipes = true
end
wsys.plist(matches[3], matches[4], matches[5])

