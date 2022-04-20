if ak.ai() then return end
ak.mounted = false
if IsTargetted(multimatches[2][2]) then
   aff = "leftleg rightleg rightarm leftarm prone"
   OppGainedAff(aff) 
end
