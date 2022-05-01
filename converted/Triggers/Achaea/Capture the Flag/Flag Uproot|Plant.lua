local color = '<badblood>'
if matches[3] == 'planting' then color = '<SpringGreen>' end
cecho('\n\n'.. color .. matches[2]:upper() ..' '.. matches[3]:upper() ..' FLAG!!\n\n')
Megophrys.PartyChatConsole:cecho(color ..'FLAG '.. matches[3]:upper() ..': '.. matches[2]:upper() ..'\n')
