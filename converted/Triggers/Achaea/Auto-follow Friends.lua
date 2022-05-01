local beckoner = matches[2]

local acceptable_beckoners = {
}

for _, ok_guy in pairs(acceptable_beckoners) do
  if beckoner == ok_guy then send('fol '.. beckoner) end
end
