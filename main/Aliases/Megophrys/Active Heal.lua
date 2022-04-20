local healTries = {'touch crystal'}

if gmcp.Char.Status.class == 'Magi' then
  healTries[#healTries + 1] = 'absorb energy'
  healTries[#healTries + 1] = 'cast bloodboil'
elseif gmcp.Char.Status.class == 'Blademaster' then
  healTries[#healTries + 1] = 'shin phoenix'
  healTries[#healTries + 1] = 'alleviate'
elseif gmcp.Char.Status.class == 'Psion' then
  healTries[#healTries + 1] = 'psi expunge'
  healTries[#healTries + 1] = 'psi breakthrough'
elseif gmcp.Char.Status.class == 'Alchemist' then
  healTries[#healTries + 1] = 'educe salt'
end

sendAll('setalias activeHeal '.. table.concat(healTries, ' / '),
        'queue addclear eqbal activeHeal')
