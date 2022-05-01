-- fun fact: this is backwards because it's the only efficient way to pop in lua
local commands = {
  -- Bazaar & Porta Aquila
  'goto 4639', 's', 'se', 'se', 'e', 'goto 4646',
  'goto 7654', 'sw', 'nw', 'nw', 'n', 'e', 'ne',
  'goto 4650', 'goto 4655', 'n', 'n', 'n', 'goto 4487', 'goto 4674',
  'ne', 'w', 's', 's', 'sw', 's', 's', 's', 's', 'goto 4482',
  'n', 'n', 'n', 'goto 6135', 'n', 'n', 'n', 'goto 5008',
  'n', 'n', 'goto 4543', 'sw', 's', 'se', 'e', 'goto 4538',
  -- Northwestern Corner
  'goto 5930', 'down', 'w', 'goto 31398', 's', 's', 'e', 'se',
  'ne', 'n', 'n', 'nw', 'goto 4531', 'goto 36167', 'goto 4728',
  's', 's', 'nw', 'w', 'goto 4528', 'goto 35274', 'n', 'nw', 'n', 'n', 'sw', 'w',
  'goto 4525', 'goto 36098', 's', 's', 'w', 'sw', 'nw', 'n',
  -- Eventide Alehouse & Serpentis Blvd
  'w', 'w', 'goto 20202', 's', 's', 'goto 6840', 's', 's', 'goto 6830',
  's', 's', 'goto 6836', 'goto 4673', 'n', 'e', 'goto 5487',
  'n', 'e', 'e', 'goto 4516', 'goto 15758', 'out', 's', 's',
  -- Old Quarter
  'ne', 'e', 'se', 'e', 'se', 'goto 4522', 'n', 'e', 'e', 'se', 'goto 1380',
  'w', 'n', 'e', 'goto 4973', 'w', 'w', 'goto 1396', 'e', 'goto 1389',
  'goto 1391', 'w', 'up', 'n', 'goto 1387', 'e', 'n', 'nw', 'nw', 'goto 1395',
  'n', 'w', 'out', 'goto 1332', 'goto 5450', 's', 'goto 1336', 'goto 5553',
  'ne', 's', 'goto 1339', 'w', 'w', 'n', 'goto 6419',
  'ne', 's', 'goto 1373', 'goto 5460', 'goto 1342',
  'se', 'sw', 'w', 'n', 'goto 1404', 'up', 'e', 'n', 'n', 'w',
  -- Coliseum, Obelisk, and Port
  'goto 4493', 'n', 'sw', 'w', 'sw', 'goto 4466', 'up', 'n', 'goto 25811',
  's', 's', 's', 's', 'sw', 's', 'goto 4484', 'goto 4467', 'goto 4508', 'n',
  'w', 'nw', 'w', 'goto 4495', 'n', 'w', 'w', 's', 'se', 's',
  -- Shopping Centre by Crossroads
  'goto 4471', 'se', 'se', 'goto 4399',
  's', 's', 'goto 6822', 's', 's', 'goto 6842',
  'goto 6866', 'up', 'n', 'n', 'w', 'sw', 'n', 'goto 6864',
  -- Court & Seneschal's Complex
  'goto 4564', 'goto 10582', 'goto 19673', 'w', 'n', 'goto 4560',
  'goto 4559', 's', 'nw', 'n', 'w', 'goto 4558', 'goto 5523', 'nw', 'w',
  'goto 5526', 'w', 'sw', 's', 'e', 'goto 5524', 'e', 'ne', 'goto 5520',
  'w', 'sw', 's', 's', 'w', 's', 'goto 6816', 'n', 'sw', 's', 'goto 6824',
  -- Ereptor St & Prospero Ave
  'goto 4599',
  'w', 'goto 39237', 'goto 39331', 'e', 'n', 'in', 'n', 'goto 4601', 'goto 4607',
  'w', 'nw', 'ne', 'e', 's', 'e', 'n', 'goto 4602', 'goto 4613', 'goto 59114',
  'goto 59649', 'n', 'n', 'w', 'w', 'sw', 'se', 'goto 4614', 'goto 6132', 'w', 'up',
  'w', 'w', 's', 'sw', 'goto 4612', 'goto 9988', 'e', 'e', 'se',
  'goto 4622', 'up', 'w', 'se', 'se', 'goto 4619', 'in', 's', 'sw',
  -- Menagerie & Park
  'goto 4599', 'goto 4573', 'nw', 's', 's', 'nw', 'n', 'sw', 'se', 's', 'se',
  'goto 4589', 'goto 4579', 'goto 4584', 'w', 'w', 's', 's', 'e', 'e', 'n', 'e',
  'ne', 'nw', 'w', 'w', 'w', 'sw', 'w', 'sw', 's', 'goto 4569',
  -- Black Lotus Monastery & Porta Nemorosus
  'e', 'se', 'e', 's', 's', 'goto 4630', 'goto 4634', 'goto 1319', 'goto 30359',
  'n', 'e', 'e', 'e', 's', 'se', 'w', 's', 'e', 's', 's',
  -- Planetarium
  'sw', 'sw', 'se', 'e', 'goto 41032', 'goto 27754', 'goto 27769',
  'goto 27759', 'e', 'ne', 'w', 'w', 'w', 'sw', 'e', 'se',
  'd', 's', 'd','d', 'd', 'ne', 'd', 'd', 'sw', 'd', 'd',
}

expandAlias('opsec reset')
expandAlias('goto 26639')
opsec.checkWormholes = false

tempTimer(12, [[ echo('\nStarting opsec run in 4...\n') ]])
tempTimer(13, [[ echo('3...\n') ]])
tempTimer(14, [[ echo('2...\n') ]])
tempTimer(15, [[ echo('1...\n') ]])
opsec.runTimer = tempTimer(16, function() opsec.doCommand(commands) end)
