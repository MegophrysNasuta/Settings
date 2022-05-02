-- fun fact: this is backwards because it's the only efficient way to pop in lua
local commands = {
  -- Veil's end
  'goto 40513', 'ne', 'n', 'w', 'n', 'goto 40975',
  'e', 'se', 's', 'sw', 'se', 'ne', 'ne', 's', 'goto 6848', 'goto 6850',
  'sw', 'goto 4715', 'goto 4883', 'goto 4888', 'goto 5243', 'e', 'e', 'goto 2656',
  'sw', 'e', 'se', 'e', 'se', 'se', 'w', 'goto 40370',
  -- Eusian Falls
  'up', 'n', 'up', 'up', 's', 's', 'up', 'n', 'n', 'up', 's', 'goto 40490',
  -- Shornwall
  'goto 40403', 'w', 's',' w', 'n', 'goto 40235', 'n', 'e',
  'goto 40739', 'goto 4309', 'goto 42', 'goto 40372', 'n', 'se', 'sw', 'goto 3687',
  'goto 5515', 'goto 6844', 'goto 40435', 'goto 5403', 'goto 4462',
  'sw', 'sw', 'w', 'goto 40218', 'goto 40766',
  's', 'se', 'se', 'e', 'nw', 'goto 20797',
  -- Anost
  'n', 'n', 'se', 'ne', 'goto 40154',
  's', 'e', 'e', 'goto 40090', 's', 'se', 'goto 40069',
  -- Duskmere
  'sw', 's', 'goto 40431',
  's', 'sw', 's', 'ne', 'e', 'goto 2353', 'e', 'sw',
  'w', 'w', 'sw', 'n', 'nw', 'w', 'ne', 'e', 'e', 'se', 'goto 22107',
  'goto 6856', 'e', 'nw', 'down', 'goto 40346', 'goto 4220', 'goto 5494',
  'goto 3725', 'goto 6862', 'nw', 'n', 'e', 'e', 'e', 'goto 38928',
  -- Blackstone Quarter
  'n', 'down', 'e', 'down', 'down', 'down', 'ne', 'e', 'goto 51853',
  'n', 'e', 'se', 'e', 'down', 's', 'ne', 'n', 'n', 'n', 'goto 39933',
  'up', 'up', 'goto 40461', 'w', 's', 's', 'sw', 'goto 40387',
  -- Averrone
  's', 'se', 'se', 'ne', 'goto 41814', 'up', 'goto 41095', 'up', 'se', 'goto 40776',
  -- Sundown & Mirror Isles
  'e', 'e', 'e', 'goto 35083', 'goto 35279', 'goto 42079', 'goto 4431', 'goto 42678',
  'sw', 'w', 'sw', 'se', 'goto 41322', 'w', 'sw', 'w', 'goto 36883',
  -- Acacia Isle
  'goto 38903', 'goto 40785', 'up',
  'n', 'ne', 'ne', 'e', 'n', 'n', 'w', 'w', 'w', 's', 's', 'se', 's', 'goto 32098',
  'sw', 'se', 'goto 3852', 'goto 6854', 'goto 3551',
  'nw', 'sw', 'e', 'goto 3722', 's', 'w', 'goto 3831', 'goto 40684',
  -- Greathorn
  'nw', 'w', 'w', 'sw', 'w', 'goto 39992',
  'sw', 'goto 42233', 'goto 41251', 'n', 'goto 40906', 'goto 40026', 'goto 40755', 'w', 'n', 'nw', 'nw',
  -- Pillars of the Morning
  'goto 40031', 'n', 'w', 'w', 'n', 'goto 40349',
  'up', 'up', 'in', 'se', 's', 's', 'goto 40356',
  'up', 'up', 'in', 'ne', 'e', 'e', 'e', 'n', 'n', 'goto 40243',
  -- Western Brighthold & Isle of Ram
  'w', 'n', 'n', 'se', 'goto 45442', 'goto 41550', 'goto 41283', 'goto 22269',
  'goto 41259', 'goto 42146', 'se', 'n', 'goto 41351', 'goto 40367',
  'nw', 'w', 'goto 40359', 's', 's', 'goto 40192', 's', 's', 'goto 40190',
  -- Square and Temples
  'goto 40256', 'goto 40409', 'goto 40415',
  'w', 's', 'w', 'goto 40265', 'goto 40379', 'goto 40374', 'e', 'n', 'w', 'n',
  -- Terrace of the Dawn
  'goto 40257', 'e', 'e', 'e', 'n',
  'goto 40505', 'e', 'n', 'goto 40514', 'e', 'n', 'n', 'goto 40520', 'n', 'w', 'w',
  'goto 40527', 'e', 'e', 's', 'goto 40557', 'goto 40586', 's', 'e', 'n', 'n',
  'goto 40558', 's', 'e', 'goto 40599', 'n', 'e', 'n', 'd'
}

expandAlias('opsec reset')
expandAlias('goto 40609')
opsec.checkWormholes = false

tempTimer(6, [[ echo('\nStarting opsec run in 4...\n') ]])
tempTimer(7, [[ echo('3...\n') ]])
tempTimer(8, [[ echo('2...\n') ]])
tempTimer(9, [[ echo('1...\n') ]])
opsec.runTimer = tempTimer(10, function() opsec.doCommand(commands) end)
