--ColorPrompt

local convert = {

                ["addiction"]      = "add",
                ["agoraphobia"]    = "agor",
                ["anorexia"]       = "anor",
                ["aeon"]           = "aeon",
								["amnesia"]        = "amn",
                ["aflame"]         = "aflame",
                ["airfist"]        = "afist",
                ["asthma"]         = "ast",
                ["blind"]          = "bld",
								["blisters"]       = "bls",
                ["blackout"]       = "blko",
                ["bound"]          = "bound",
								["brand"]          = "brnd",
                ["claustrophobia"] = "claus",
                ["clumsiness"]     = "clum",
                ["conflagrate"]    = "cnflg",
                ["confusion"]      = "conf",
								["corruption"]     = "corr",
                ["crippledarm"]    = "carm",
                ["crippledleg"]    = "cleg",
						    ["crushedthroat"]  = "cthroat",
                ["darkshade"]      = "dark",
                ["deadening"]      = "dead",
                ["depression"]     = "deep",
                ["deaf"]           = "deaf",
                ["dehydrate"]      = "dehy",
                ["dementia"]       = "dem",
                ["disloyalty"]     = "dloyal",
                ["disrupt"]        = "dis",
                ["dizziness"]      = "diz",
                ["epilepsy"]       = "epi",
                ["enlighten"]      = "LIT",
                ["frozen"]         = "frzn",
                ["generosity"]     = "genor",
                ["guilt"]          = "gul",
                ["haemophilia"]    = "haem",
                ["hallucinations"] = "hall",
                ["hamstring"]      = "hamst",
                ["healthleech"]    = "hleach",
                ["hellsight"]      = "hsight",
                ["hierophant"]     = "hiero",
                ["hypersomnia"]    = "hyper",
                ["hypochondria"]   = "hypo",
                ["hypothermia"]    = "hypot",
                ["impaleslash"]    = "is",
                ["impatience"]     = "imp",
                ["inquisition"]    = "inq",
                ["justice"]        = "just",
                ["kola"]           = "kola",
                ["lethargy"]       = "leth",
                ["loneliness"]     = "lonl",
                ["masochism"]      = "maso",
                ["manaleech"]      = "mleach",
								["mindravaged"]    = "mrvg",
                ["nausea"]         = "naus",
                ["pacifism"]       = "pac",
                ["paralysis"]      = "para",
                ["parasite"]       = "paras",
                ["petrified"]      = "PETD",
                ["paranoia"]       = "prnd",
								["preempt"]        = "pree",
                ["prone"]          = "prn",
                ["recklessness"]   = "reck",
                ["retribution"]    = "ret",
                ["rixil"]          = "rixil",
                ["scalded"]        = "scald",
                ["scytherus"]      = "scy",
                ["selarnia"]       = "sel",
                ["sensitivity"]    = "sen",
                ["slime"]          = "slm",
                ["shadowmadness"]  = "smad",
                ["shyness"]        = "shy",
                ["slickness"]      = "slick",
                ["spiritburn"]     = "sburn",
								["stuttering"]     = "stut",
                ["surge"]          = "surge",
                ["tempslickness"]  = "slick2",
								["tension"]        = "ten",
                ["stupidity"]      = "stu",
                ["tenderskin"]     = "tskin",
                ["transfixed"]     = "trans",
                ["timeflux"]       = "tfx",
                ["timeloop"]       = "tloop",
                ["trussed"]        = "trst",
                ["unconscious"]    = "uncon",
                ["weariness"]      = "weari",
                ["whisperingmadness"] = "wmad",
                ["wrenchhead"]     = "wrth",
                ["wrenchtorso"]     = "wrtt",
                ["worm"]           = "wrm",
                ["vertigo"]        = "vert",
                ["vitiate"]        = "vit",
                ["voyria"]         = "voyria",
                ["voidfist"]       = "vfist",
                ["rightleg"]       = "rl",
                ["leftleg"]       = "ll",
                ["rightarm"]       = "ra",
                ["leftarm"]       = "la",
                ["head"]       = "h",
                ["torso"]       = "tt",
                ["trussed"]        = "trsd",
                ["unconscious"]    = "unc",  
                ["airdisrupt"]  = "adsr",
                ["earthdisrupt"]  = "edsr",
                ["firedisrupt"]  = "fdsr",
                ["spiritdisrupt"]  = "sdsr",
                ["waterdisrupt"]  = "wdsr",
								["unweavingmind"] = "umind",
								["unweavingbody"] = "ubody",
								["unweavingspirit"] = "uspirit",
								["bloodfire"]     = "bfire",
}
ak.prompt = ak.prompt or {}
--if ak.prompt.unique then return end
ak.prompt.uniqueset = {"hallucinations","dizziness","recklessness","confusion","paranoia","epilepsy","impatience"}
ak.prompt.uniquesymbol = "<cyan>+"
ak.prompt.donotrelay = {"rixil","slime","hierophant"}
ak.prompt.currentcolor = "<yellow>"
ak.prompt.enablecolor = true
ak.prompt.lockgroup = true
ak.prompt.default = "<yellow>"
ak.prompt.colours = {}
ak.prompt.lockpriority = { 
  [1] = "PTLOCK",
  [2] = "HLOCK",
  [3] = "SLOCK",
  [4] = "VLOCK",
}
ak.prompt.locks = {
  PTLOCK = {"anorexia","asthma","slickness","paralysis","impatience"},
  HLOCK = {"anorexia","asthma","slickness","paralysis"},
  SLOCK = {"anorexia","asthma","slickness","impatience"},
  VLOCK = {"anorexia","asthma","slickness"},
}
ak.prompt.colours.lock = {
  PTLOCK = "<deep_pink>",
  HLOCK = "<deep_pink>",
  SLOCK = "<hot_pink>",
  VLOCK = "<hot_pink>",
}
ak.prompt.colours.specific = {
   Kelp = "<green>",
   Goldenseal = "<white>",
   Ginseng = "<blue>",
   Salve = "<cyan>", 
   Ash = "<purple>",
   Deathly = "<cyan>",
	 Smoke = "<orange>",
   }
ak.prompt.colours.afflictions = {
   Kelp = {"asthma", "clumsiness", "hypochondria", "sensitivity", "weariness", "healthleech"},      
   Goldenseal = {"dizziness", "epilepsy", "impatience", "shyness", "stupidity", "unweavingmind"},
   Ginseng = {"addiction", "darkshade", "haemophilia", "lethargy", "nausea", "scytherus", "unweavingbody"},
   Salve = {"aflame", "rightleg", "leftleg", "rightarm", "leftarm", "head", "torso"}, 
   Ash = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"} ,
   Deathly = {"enlighten","voyria"},
	 Smoke = {"tension","manaleech","deadening","disloyalty", "unweavingspirit"}, 
}
function ak.prompt.unique(aff)
   if table.contains(ak.prompt.uniqueset, aff) then
      return ak.prompt.uniquesymbol..""..ak.prompt.currentcolor
   else
      return ""
   end
end

function ak.prompt.setassign()
   if gmcp.Char.Status.class == "Bard" then
      ak.prompt.uniqueset = {"agoraphobia","claustrophobia","dementia","epilepsy","masochism","recklessness","vertigo","confusion", "dizziness", "impatience", "paranoia", "stupidity", "addiction"}
   elseif gmcp.Char.Status.class == "Sentinel" then
      ak.prompt.uniqueset = {"hallucinations","dizziness","recklessness","confusion","paranoia","epilepsy","impatience"}
   elseif gmcp.Char.Status.class == "Occultist" then
      ak.prompt.uniqueset = {"dementia","stupidity","confusion","hypersomnia","paranoia","hallucinations","impatience","recklessness","masochism","agoraphobia","loneliness","lovers"}   
   else
      ak.prompt.uniqueset = {}
   end
end
function ak.prompt.scoreup()
  ak.prompt.setassign()
  ak.prompt.donotgroup = {}
  ak.prompt.lockconflict = false
  ak.prompt.currentcolor = ak.prompt.default
  promptset = {}
  local donotreprompt = {}
  if ak.prompt.lockgroup then
     for i = 1, #ak.prompt.lockpriority do
        for x = 1, #ak.prompt.locks[ak.prompt.lockpriority[i]] do
           if affstrack.score[ak.prompt.locks[ak.prompt.lockpriority[i]][x]] > 50 and not ak.prompt.lockconflict then
              if x == #ak.prompt.locks[ak.prompt.lockpriority[i]] and not table.contains(ak.prompt.donotgroup, ak.prompt.lockpriority[i]) then
                 if table.contains(ak.prompt.colours.lock, ak.prompt.lockpriority[i] ) then
                    table.insert(promptset, ak.prompt.colours.lock[ak.prompt.lockpriority[i]]..""..ak.prompt.lockpriority[i])
                    ak.prompt.lockconflict = true
                 else
                    table.insert(promptset, ak.prompt.lockpriority[i])
                    ak.prompt.lockconflict = true
                 end
                 for m = 1, #ak.prompt.locks[ak.prompt.lockpriority[i]] do
                    table.insert(donotreprompt, ak.prompt.locks[ak.prompt.lockpriority[i]][m])
                 end   
              end
           elseif not table.contains(ak.prompt.donotgroup, ak.prompt.lockpriority[i]) then
              table.insert(ak.prompt.donotgroup, ak.prompt.lockpriority[i])
           end
        end
     end
  end
  if ak.prompt.enablecolor then
     for k,v in pairs(ak.prompt.colours.afflictions) do
        if #ak.prompt.colours.afflictions[k] > 0 then
           for i = 1,#ak.prompt.colours.afflictions[k] do
              if affstrack.score[ak.prompt.colours.afflictions[k][i]] > 1 and convert[ak.prompt.colours.afflictions[k][i]] and not table.contains(ak.prompt.donotrelay, ak.prompt.colours.afflictions[k][i]) and not table.contains(donotreprompt, ak.prompt.colours.afflictions[k][i]) then         
                 if affstrack.score[ak.prompt.colours.afflictions[k][i]] == 100 and convert[ak.prompt.colours.afflictions[k][i]] then
                    ak.prompt.currentcolor = ak.prompt.colours.specific[k]
                    table.insert(promptset, ak.prompt.colours.specific[k]..""..ak.prompt.unique(ak.prompt.colours.afflictions[k][i])..""..convert[ak.prompt.colours.afflictions[k][i]])
                    table.insert(donotreprompt, ak.prompt.colours.afflictions[k][i])
                 elseif convert[ak.prompt.colours.afflictions[k][i]] then
                    ak.prompt.currentcolor = ak.prompt.colours.specific[k]
                    table.insert(promptset, ak.prompt.colours.specific[k]..""..ak.prompt.unique(ak.prompt.colours.afflictions[k][i])..""..convert[ak.prompt.colours.afflictions[k][i]].."["..math.floor(affstrack.score[ak.prompt.colours.afflictions[k][i]] + 0.5).."]")
                    table.insert(donotreprompt, ak.prompt.colours.afflictions[k][i])
                 end
              end
           end
        end
     end
  end
  for k,v in pairs(affstrack.score) do
     if v > 1 and convert[k] and not table.contains(donotreprompt, k)and not table.contains(ak.prompt.donotrelay, k) then         
        if v == 100 and convert[k] then
           ak.prompt.currentcolor = ak.prompt.default
           table.insert(promptset, ak.prompt.default..""..ak.prompt.unique(k)..""..convert[k])
        elseif convert[k] and not table.contains(ak.prompt.donotrelay, k)  then
           ak.prompt.currentcolor = ak.prompt.default
           table.insert(promptset, ak.prompt.default..""..ak.prompt.unique(k)..""..convert[k].."["..math.floor(v + 0.5).."]" )
        end
     end
  end
  if affstrack.impale then
     ak.prompt.currentcolor = ak.prompt.default
     table.insert(promptset, "<cyan>IMPALED")
  end
  if ak.track.flown then
     ak.prompt.currentcolor = ak.prompt.default
     table.insert(promptset, "<white>FLOWN")
  end
  if gmcp.Char.Status.class == "Infernal" or gmcp.Char.Status.class == "Paladin" or gmcp.Char.Status.class == "Runewarden" or gmcp.Char.Status.class == "Magi" or gmcp.Char.Status.class == "Serpent" or gmcp.Char.Status.class == "Bard" then
		if ak.defs.rebounding then
			table.insert(promptset,"<blue>Reb")
		end
		if affstrack.ferocity and affstrack.ferocity > 0 then
		   table.insert(promptset,"<cyan>[<red>"..affstrack.ferocity.."<cyan>]")	
		end
  end
	if gmcp.Char.Status.class == "Occultist" then
		if ak.occie.aura.mental > 0 or ak.occie.aura.physical > 0 then
			table.insert(promptset,"<cyan>[<white>"..ak.occie.aura.physical.."/<green>"..ak.occie.aura.mental.."<cyan>]")
		end
  end
	if gmcp.Char.Status.class == "Depthswalker" then
    local age = ak.age or 0
    if age ~= 0 then
	   table.insert(promptset,"<white>[<red>"..ak.age().."<white>]")	
    end
	end	
	if ak.bleeding and ak.bleeding > 0 then
	   table.insert(promptset,"<cyan>[<red>"..ak.bleeding.."<cyan>]")
	end
	if gmcp.Char.Status.class == "Shaman" and ak.shaman.GetFashions then
	   table.insert(promptset,"<cyan>[<red>F<cyan>]")	
	end
end





