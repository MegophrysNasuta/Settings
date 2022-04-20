local action = 'activate'
if matches[2] == 'off' then
  action = 'deactivate'
end

send('city improvement '.. action ..' orb')
