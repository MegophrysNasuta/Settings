local language = ''
local speech_pattern = ''
if matches[2] == 'h' then
  language = 'human'
  speech_pattern = 'accent strange, forced'
elseif matches[2] == 'm' then
  language = 'mhaldorian'
  speech_pattern = 'voice rasping guttural'
elseif matches[2] == 'a' then
  language = 'common'
  speech_pattern = 'voice rasping guttural'
elseif matches[2] == 'g' then
  language = 'grook'
  speech_pattern = 'voice piercing metallic'
end
send('speak ' .. language)
send('set ' .. speech_pattern)
