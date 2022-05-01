local item = matches[2]
local qty = matches[3]
local cmd = 'buy '

if item == 'letter' or item == 'parcel' then cmd = 'request ' end

elixirs = {'health', 'mana', 'mending', 'immunity', 'epidermal', 'restoration',
          'caloric', 'mass', 'slike', 'delphinium', 'gecko', 'voyria', 'speed',
          'venom', 'levitation', 'frost'}
          
for _, elixir in pairs(elixirs) do 
  if item == elixir then cmd = 'refill rift from ' end
end

sendAll('get '.. qty ..' sovereigns from pack',
        cmd .. item)
