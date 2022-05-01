if ak.ai() then return end
if IsTargetted(matches[2]) then
   pullray = {}
   if matches[3] then table.insert(pullray, matches[3]) end
   if matches[4] then table.insert(pullray, matches[4]) end
   if matches[5] then table.insert(pullray, matches[5]) end
   if table.contains(pullray,"orange") then OppGainedAff("paralysis") end
   if table.contains(pullray,"violet") then OppGainedAff("aeon") end
   if table.contains(pullray,"indigo") then OppGainedAff("stupidity") end
end

