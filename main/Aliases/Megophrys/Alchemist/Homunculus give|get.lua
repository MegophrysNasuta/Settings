if matches[3] then
  send('homunculus give '.. matches[2] ..' to '.. matches[3])
else
  send('homunculus get '.. matches[2])
end
