local pack = 'pack370332'
local mask = 'mask160277'
local gloves = 'gloves479407'
local coat = 'coat521859'
local goggles = 'goggles494089'
if matches[2] == 'up' then
  sendAll(
    'get '.. mask ..' from '.. pack,
    'get '.. gloves ..' from '.. pack,
    'get '.. goggles ..' from '.. pack,
    'get '.. coat ..' from '.. pack,
    'wear '.. mask,
    'wear '.. coat,
    'wear '.. goggles,
    'wear '.. gloves
  )
else
  sendAll(
    'remove '.. mask,
    'remove '.. gloves,
    'remove '.. goggles,
    'remove '.. coat,
    'put '.. mask ..' in '.. pack,
    'put '.. gloves ..' in '.. pack,
    'put '.. goggles ..' in '.. pack,
    'put '.. coat ..' in '.. pack
  )
end
