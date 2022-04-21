local tbl = {f='follow', l='look', L='listen on', LL='listen off',
             r='return', x='exits'}
send('homunculus '.. tbl[matches[2]])
