
function ak.expertRun()
   possiblechecksAK = {}
   vcombo = vcombo or {}
   currentlydiagnosingak = nil
   for k,v in pairs(affstrack.score) do
      if (v > 1 and AkcheckPrioList[k] and AkcheckPrioList[k] ~= 0) and (not table.contains(affstrack.venoms, k) or not table.contains(vcombo, affstrack.venoms[k])) then
         local mathed = v
         if mathed < 50 then
            mathed =  50-((mathed - 50) * -1)
         else
            mathed = 50-(mathed - 50)
         end
         if (mathed + AkcheckPrioList[k]) > 100 then
            possiblechecksAK[k] = (mathed + AkcheckPrioList[k])
         end
         mathed = nil
      end
   end
   ak.ExpertPickanAff()
end

function ak.ExpertPickanAff()
   for k,v in pairs(possiblechecksAK) do
      if currentlydiagnosingak == nil then
         currentlydiagnosingak = k
      end 
      if v > possiblechecksAK[currentlydiagnosingak] then
         currentlydiagnosingak = k
      end
   end
   if currentlydiagnosingak then
      currentlydiagnosingak = "check "..target.." for "..currentlydiagnosingak 
   else
      currentlydiagnosingak = ""
   end
   if not ak.diagnosingoffbal and currentlydiagnosingak ~= "" then
      send(currentlydiagnosingak)
   end
end
AkcheckPrioList = {
                ["addiction"]      = 0,
                ["aeon"]           = 100,
                ["agoraphobia"]    = 0,
                ["anorexia"]       = 0,
                ["aflame"]         = 0,
                ["airfist"]        = 0,
                ["asthma"]         = 0,
                ["blind"]          = 0,
                ["blackout"]       = 0,
                ["bound"]          = 0,
                ["claustrophobia"] = 0,
                ["clumsiness"]     = 50,
                ["confusion"]      = 0,
                ["crippledarm"]    = 0,
                ["crippledleg"]    = 0,
                ["darkshade"]      = 50,
                ["deadening"]      = 0,
                ["deaf"]           = 0,
                ["dementia"]       = 0,
                ["disloyalty"]     = 0,
                ["disrupt"]        = 0,
                ["dizziness"]      = 0,
                ["epilepsy"]       = 0,
                ["frozen"]         = 0,
                ["generosity"]     = 0,
                ["haemophilia"]    = 100,
                ["hallucinations"] = 0,
                ["hamstring"]      = 0,
                ["healthleech"]    = 0,
                ["hellsight"]      = 0,
                ["hypersomnia"]    = 0,
                ["hypochondria"]   = 100,
                ["impaleslash"]    = 0,
                ["impatience"]     = 100,
                ["insomnia"]       = 0,
                ["kola"]           = 0,
                ["lethargy"]       = 0,
                ["loneliness"]     = 0,
                ["masochism"]      = 0,
                ["manaleech"]      = 0,
                ["nausea"]         = 0,
                ["pacifism"]       = 0,
                ["paralysis"]      = 100,
                ["paranoia"]       = 0,
                ["prone"]          = 0,
                ["recklessness"]   = 0,
                ["scytherus"]      = 100,
                ["selarnia"]       = 0,
                ["sensitivity"]    = 75,
                ["shyness"]        = 0,
                ["slickness"]      = 100,
                ["sleep"]          = 0,
                ["stupidity"]      = 0,
                ["transfixed"]     = 0,
                ["timeflux"]       = 0,
                ["weariness"]      = 75,
                ["whisperingmadness"] = 0,
                ["vertigo"]        = 0,
                ["vitiate"]        = 0,
                ["voidfist"]       = 0,
                ["voyria"]         = 0,
                ["rightleg"]       = 0,
                ["leftleg"]        = 0,
                ["rightarm"]       = 0,
                ["leftarm"]        = 0,
                ["head"]           = 0,
                ["torso"]          = 0,
}
