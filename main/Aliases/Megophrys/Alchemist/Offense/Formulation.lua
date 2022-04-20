local brewTable = {intox="intoxicant", devit="devitalisation",
                   tox="toxin", incen="incendiary", vap="vaporisation",
                   mon="monoxide"}
local brew = brewTable[matches[2]]

if brew then
  send('wield '.. brew)
  if matches[3] then
    send('throw '.. brew ..' '.. matches[3])
  else
    send('throw '.. brew ..' at ground')
  end
end
