lastcured = {}
lastcured.kelp = lastcured.kelp or nil
lastcured.bloodroot = lastcured.bloodroot or nil
lastcured.ginseng = lastcured.ginseng or nil
lastcured.goldenseal = lastcured.goldenseal or nil
lastcured.ash = lastcured.ash or nil
lastcured.lobelia = lastcured.lobelia or nil
lastcured.bellwort = lastcured.bellwort or nil
lastcured.smoke = lastcured.smoke or nil
lastcured.tree = lastcured.tree or nil
lastcured.focus = lastcured.focus or nil
lastcured.bloodboil = lastcured.bloodboil or nil
lastcured.shrug = lastcured.shrug or nil
lastcured.alleviate = lastcured.alleviate or nil
lastcured.salt = lastcured.salt or nil
lastcured.purification = lastcured.purification or nil
lastcured.dagaz = lastcured.dagaz or nil
lastcured.sun = lastcured.sun or nil
lastcured.hallelujah = lastcured.hallelujah or nil
lastcured.accelerate = lastcured.accelerate or nil
lastcured.riteofhealing = lastcured.riteofhealing or nil
lastcured.timeout = lastcured.timeout or nil
lastcured.valerian = lastcured.valerian or nil
lastcured.elm = lastcured.elm or nil
lastcured.syphon = lastcured.syphon or nil
lastcured.harmony = lastcured.harmony or nil
lastcured.water = lastcured.water or nil
lastcured.airlord = lastcured.airlord or nil
lastcured.waterlord = lastcured.waterlord or nil
lastcured.eruption = lastcured.eruption or nil
lastcured.panacea = lastcured.panacea or nil
lastcured.salvearms = lastcured.salvearms or nil
lastcured.salvelegs = lastcured.salvelegs or nil
lastcured.priestfire = lastcured.priestfire or nil
lastcured.firelord = lastcured.firelord or nil


curetables = { 
["bloodroot"] = {  "slickness", "paralysis", },
["kelp"] = {"clumsiness", "healthleech", "sensitivity", "hypochondria", "weariness", "asthma", "parasite" },
["ginseng"] = { "darkshade", "haemophilia", "lethargy", "addiction", "unweavingbody" , "nausea", "scytherus" },
["goldenseal"] = { "stupidity", "epilepsy", "dizziness", "shyness", "unweavingmind", "impatience", "depression", "shadowmadness" },
["ash"] = { "agoraphobia", "confusion", "hypersomnia", "dementia", "paranoia", "hallucinations" },
["lobelia"] = { "masochism", "loneliness", "vertigo", "recklessness", "claustrophobia", "tenderskin", "spiritburn", "guilt" },
["bellwort"] = { "timeloop", "peace", "justice", "lovers", "generosity", "retribution" },
["smoke"] = { "manaleech", "unweavingspirit" , "slickness", "whisperingmadness", "aeon", "hellsight" },
["elm"] = { "aeon",  "deadening", "tension", "dazed", "whisperingmadness"},
["valerian"] = { "disloyalty", "manaleech", "hellsight",  "slickness"},
["concentrate"] = {"disrupted",},
["moss"] = {},
["kola"] = {},
["tree"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia" , "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"weariness", "anorexia", "impatience", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "brokenleftleg", "brokenrightleg", "brokenleftarm", "brokenrightarm", "lepteth", "repteth", "lepseth", "repseth", "spiritburn", "tenderskin", "hellsight" },
["focus"] = { "agoraphobia",  "claustrophobia", "confusion", "dizziness", "epilepsy", "generosity", "loneliness", "masochism", "peace", "recklessness", "shyness",
"stupidity", "anorexia", "paranoia", "vertigo", },
["bloodboil"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"weariness", "anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["shrug"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["alleviate"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"weariness", "anorexia", "impatience", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["salt"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["purification"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["dagaz"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["sun"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["hallelujah"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["accelerate"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["riteofhealing"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["syphon"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["harmony"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight",},
["water"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["airlord"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["waterlord"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["eruption"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["panacea"] = { "voyria", "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
["salvearms"] = { "damagedleftarm", "damagedrightarm", "brokenleftarm", "brokenrightarm", "lepteth", "repteth" },
["salvelegs"] = { "damagedleftleg", "damagedrightleg", "brokenleftleg", "brokenrightleg", "lepseth", "repseth" },
["salvetorso"] = { "damagedtorso", "brokentorso", "ablaze" },
["salvehead"] = { "damagedhead", "brokenhead" },
["priestfire"] = { "impatience", "paralysis", "confusion" },
["firelord"] = { "clumsiness", "healthleech", "sensitivity", "darkshade", "lethargy", "addiction", "hypocondria", "scytherus", "nausea", "peace", "stupidity", "epilepsy", 
"agoraphobia", "shyness", "masochism", "claustrophobia", "recklessness", "dizziness", "confusion", "paranoia", "loneliness", "vertigo", "hypersomnia", "justice", "lovers", "dementia", 
"anorexia", "impatience", "paralysis", "asthma", "timeloop", "unweavingmind", "unweavingbody", "unweavingspirit", "voyria", "shivering", "frozen", "retribution", "depression", "spiritburn", "tenderskin", "hellsight", },
}

function resetTracking() 
	for k, v in pairs (lastcured) do
		lastcured[k] = nil
	end
	for k, v in pairs (curetime) do
		curetime[k] = nil
	end
end

curetime = {}
curetime.bloodroot = curetime.blootroot or nil
curetime.kelp = curetime.kelp or nil
curetime.ginseng = curetime.ginseng or nil
curetime.goldenseal = curetime.goldenseal or nil
curetime.ash = curetime.ash or nil
curetime.lobelia = curetime.lobelia or nil
curetime.bellwort = curetime.bellwort or nil
curetime.smoke = curetime.smoke or nil
curetime.tree = curetime.tree or nil
curetime.focus = curetime.focus or nil
curetime.bloodboil = curetime.bloodboil or nil
curetime.shrug = curetime.shrug or nil
curetime.alleviate = curetime.alleviate or nil
curetime.salt = curetime.salt or nil
curetime.purification = curetime.purification or nil
curetime.dagaz = curetime.dagaz or nil
curetime.sun = curetime.sun or nil
curetime.hallelujah = curetime.hallelujah or nil
curetime.accelerate = curetime.accelerate or nil
curetime.riteofhealing = curetime.riteofhealing or nil
curetime.valerian = curetime.valerian or nil
curetime.elm = curetime.elm or nil
curetime.syphon = curetime.syphon or nil
curetime.harmony = curetime.harmony or nil
curetime.water = curetime.water or nil
curetime.airlord = curetime.airlord or nil
curetime.waterlord = curetime.waterlord or nil
curetime.eruption = curetime.eruption or nil
curetime.panacea = curetime.panacea or nil
curetime.salvearms = curetime.salvearms or nil
curetime.salvelegs = curetime.salvelegs or nil
curetime.priestfire = curetime.priestfire or nil
curetime.firelord = curetime.firelord or nil

herbConversion = {
["aurum flake"]      = "kelp",
["piece of kelp"]    = "kelp",
["lobelia seed"]     = "lobelia",
["argentum flake"]   = "lobelia",
["prickly ash bark"] = "ash",
["stannum flake"]    = "ash",
["bellwort flower"]  = "bellwort",
["cuprum flake"]     = "bellwort",
["goldenseal root"]  = "goldenseal",
["plumbum flake"]    = "goldenseal",
["bloodroot leaf"]   = "bloodroot",
["magnesium chip"]   = "bloodroot",
["ginseng root"]     = "ginseng",
["ferrum flake"]     = "ginseng",
["hawthorn berry"]   = "hawthorn",
["calamine crystal"] = "hawthorn",
["bayberry bark"]    = "bayberry",
["arsenic pellet"]   = "bayberry",
["calcite mote"]     = "pear",
["prickly pear"]     = "pear",
["elm"]              = "elm",
["cinnabar"]         = "elm",
["valerian"]         = "valerian",
["realgar"]          = "valerian",
["potash crystal"]   = "moss",
["quartz pellet"]    = "kola",
["irid moss"]        = "potash crystal",
}
