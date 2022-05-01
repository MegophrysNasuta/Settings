local color = '<badblood>'
if matches[2] == 'PLANTED' then color = '<SpringGreen>' end
cecho('\n\n'.. color .. matches[3]:upper() ..' '.. matches[2]:upper() ..' FLAG!!\n\n')
Megophrys.PartyChatConsole:cecho(color ..'FLAG '.. matches[2]:upper() ..': '.. matches[3]:upper() ..'\n')
