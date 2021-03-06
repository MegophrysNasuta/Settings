-- fun fact: this is backwards because it's the only efficient way to pop in lua
local commands = {
  -- More Balegrim Fortress
  'goto 11090', 'goto 10713', 'up', 'w', 'sw', 's', 's', 'se',
  'e', 'e', 'ne', 'n', 'n', 'nw', 'goto 10717', 'up', 'up', 'goto 10710',
  'goto 10672', 'goto 10671', 'goto 60202', 'goto 60887', 'goto 60998',
  -- Spire of Malevolance
  'goto 60439', 'in', 'out', 'up', 'goto 60369', 'goto 61310', 'goto 61186', 'nw',
  -- Mhaldor Road & Baelgrim Fortress
  'goto 60676', 'goto 31686', 'goto 60202',
  'n', 'n', 'goto 10702', 'e', 'e', 'goto 61716', 'w', 'up',
  'up', 'e', 'goto 10693', 'goto 13436', 'w', 's', 'e', 'e', 'goto 10664',
  'n', 'sw', 's', 'goto 28778', 'nw', 'goto 14314', 'goto 10660',
  'd', 'n', 'n', 'n', 'n', 'up', 'up', 'up', 'up',
  -- Gatehouse & lab
  'goto 11095', 'goto 10577', 'goto 30958', 'w', 's', 
  'goto 11089', 'goto 11142', 'w', 'se', 'goto 11142', 'goto 40330',
  'n', 'e', 'se', 'se', 's', 'goto 11134', 'e', 's', 'goto 11130',
  -- Red Square
  'goto 55665', 'goto 4423', 'goto 11933', 'sw', 's', 'w', 'w', 'nw', 'n',
  'goto 12475', 'goto 52963', 'goto 48909', 'goto 52103', 'goto 9802',
  'goto 9805', 'goto 9766', 'nw', 'e', 'n', 'n', 'nw', 'goto 12479',
  -- Museum & Surrounding
  'goto 46930', 'n', 'in', 'w', 'w', 'goto 12483', 's', 's', 'e', 'n',
  'goto 27425', 'w', 'w', 'n', 'e', 'e', 'ne', 's', 's', 's',
  'goto 27479', 's', 's', 'w', 'sw', 'sw', 'goto 12470',
  'e', 'e', 'goto 18255', 'goto 9843', 'goto 18235', 'goto 16838',
  -- Circle of Damnation & Slave Market
  'e', 'goto 12664', 'goto 13619', 'goto 8374', 'goto 12817',
  'goto 14018', 'goto 13518', 'goto 8396', 'goto 14302',
  'goto 16447', 'goto 15163', 'goto 15045', 'ne', 's', 'se', 'se',
  'goto 12460', 'goto 53384', 'w', 'n', 'e', 'e', 'ne', 'd',
  -- Vault, Blood Gulch, Tavern
  'goto 11127', 'goto 12500', 'goto 12497', 'goto 12515',
  'w', 'up', 'n', 'n', 'w', 'sw', 'd', 'd', 'goto 11145', 's',
  -- Post Office, Lab, Warehouses
  'nw', 'sw', 'goto 13147', 'goto 22328', 'goto 22531', 'goto 12478',
  's', 'sw', 'nw', 'goto 11116', 'goto 11826', 'n', 'e', 'n', 'w',
  -- Belltower & Outer
  's', 's', 's', 'e', 's', 'goto 21698',
  'goto 19972', 'goto 23343', 'n', 'up', 'n', 'w', 'up', 's', 'e',
  -- Cathedral Upper Level
  'goto 21583', 's', 'out', 'goto 23324', 'goto 23318', 'e', 'sw', 'goto 23315',
  'goto 23310', 'n', 'se', 'e', 'goto 23340', 'goto 23309', 'n', 'se',
  'goto 23306', 'n', 'e', 'goto 23303', 'goto 23302', 'w', 'ne',
  'goto 23300', 'goto 23296', 'goto 23295', 'sw', 'n', 'up', 'goto 21920',
  -- Cathedral
  'goto 20460', 'goto 20539', 'goto 21640', 'se', 's', 'sw', 'goto 21536',
  'goto 21666', 'goto 22103', 'up', 'n', 'ne', 'n', 'nw', 'n', 'n',
  'n', 'w', 's', 'e', 's', 'goto 22500', 'n', 'w', 's'
}

expandAlias('opsec reset')
expandAlias('goto 23294')
opsec.checkWormholes = false

tempTimer(12, [[ echo('\nStarting opsec run in 4...\n') ]])
tempTimer(13, [[ echo('3...\n') ]])
tempTimer(14, [[ echo('2...\n') ]])
tempTimer(15, [[ echo('1...\n') ]])
opsec.runTimer = tempTimer(16, function() opsec.doCommand(commands) end)
