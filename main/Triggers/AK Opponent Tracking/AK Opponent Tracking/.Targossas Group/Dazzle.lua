--confusion --dizziness
local aff = "confusion"
local aff2 = "dizziness"
if IsTargetted(matches[2]) then
   OppGainedAff(aff)
   OppGainedAff(aff2)
end
