if wsys.curingstatuscheck then deleteLine() end
local sippy = tonumber(matches[2])
if sippy == wsys.settings.aeonsiphealth then
  --looks like we needs to do stuff here
else
  wsys.settings.siphealth = sippy
end
