local keyPadImage = [[
 ____   ____   ____   ____   ____
| 01 | | 02 | | 03 | | 04 | | 05 |
|    | |    | |    | |    | |    |
'----' '----' '----' '----' '----'
 ____   ____   ____   ____   ____
| 06 | | 07 | | 08 | | 09 | | 10 |
|    | |    | |    | |    | |    |
'----' '----' '----' '----' '----'
 ____   ____   ____   ____   ____
| 11 | | 12 | | 13 | | 14 | | 15 |
|    | |    | |    | |    | |    |
'----' '----' '----' '----' '----'
 ____   ____   ____   ____ 
| 16 | | 17 | | 18 | | 19 |      x  x
|    | |    | |    | |    |    x      x
'----' '----' '----' '----'   x   21   x
                               x      x
                                 x  x
                         ________________
                        |                |
                        |       20       |
                        |                |
                        |                |
                        '________________'
]]

local display = keyPadImage ..'\n\n'
local toggleOneLabel = Megophrys[Megophrys.class].toggleOneLabel or 'UNASSIGNED'

display = display .. '(01) <F8> \t'.. toggleOneLabel ..'\n'
display = display .. '(02) <F9> \tToggle single/dual limb prep\n'
display = display .. '(03) <F10>\tToggle right/left primary limb prep\n'
display = display .. '(04) <F11>\tToggle head/torso prep gauge\n'
display = display .. '(05) <F12>\tToggle legs/arms limb prep\n\n'

display = display .. '(06)  `   \tPerform class-specific "Special"\n'
display = display .. '(07) <F4> \tSet primary element to EARTH\n'
display = display .. '(08) <F5> \tSet primary element to FIRE\n'
display = display .. '(09) <F6> \tSet primary element to AIR\n'
display = display .. '(10) <F7> \tSet primary element to WATER\n\n'

display = display .. '(11) L3SHF\tWith (21) MENU, AutoPursue (PURSUE)\n'
display = display .. '(12) <F13>\tUnassigned\n'
display = display .. '(13) <F14>\tUnassigned\n'
display = display .. '(14) <F15>\tDuanatharan!\n'
display = display .. '(15) <F16>\tDuanathar!\n\n'

display = display .. '(16) ALT_L\tWith (21) MENU, AutoEscape (FLEE)\n'
display = display .. '(17) <F1> \tSet Mode: HUNT (Denizen)\n'
display = display .. '(18) <F2> \tSet Mode: RAID\n'
display = display .. '(19) <F3> \tSet Mode: PK (default)\n'
display = display .. '(20) RSUP \tShields up! (RESIST)\n'
display = display .. '(21) MENU \tCommence AutoAttack (ATTACK)\n\n'

display = display .. 'EMERGENCY STOP: (11+16+21) L3SHF + ALT_L + MENU'
echo(display)

