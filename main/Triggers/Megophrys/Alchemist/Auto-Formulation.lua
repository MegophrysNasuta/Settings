local targetPotency = 1
local targetStability = 1
local targetVolatility = 1

if (matches[3] == "Incendiary" or matches[3] == "Devitalisation" or
    matches[3] == "Intoxicant" or matches[3] == "Monoxide" or
    matches[3] == "Toxin") then
  targetPotency = 2
  targetVolatility = 5
elseif matches[3] == "Nutritional" or matches[3] == "Vaporisation" then
  targetPotency = 5
  targetStability = 2
elseif matches[3] == "Enhancement" then
  targetPotency = 3
  targetStability = 4
end

local actualPotency = tonumber(matches[4])
local actualVolatility = tonumber(matches[5])
local actualStability = tonumber(matches[6])

for i=actualPotency - 1, targetPotency, -1 do
  send('dilute potency of '.. matches[2])
end

for i=actualVolatility - 1, targetVolatility, -1 do
  send('dilute volatility of '.. matches[2])
end

for i=actualStability - 1, targetStability, -1 do
  send('dilute stability of '.. matches[2])
end

for i=actualPotency + 1, targetPotency do
  send('enhance potency of '.. matches[2])
end

for i=actualVolatility + 1, targetVolatility do
  send('enhance volatility of '.. matches[2])
end

for i=actualStability + 1, targetStability do
  send('enhance stability of '.. matches[2])
end
