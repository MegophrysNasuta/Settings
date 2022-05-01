--ak config

ak = ak or {}
ak.cure = ak.cure or {}
ak.errorallowance = ak.errorallowance or 34
ak.manapercent = ak.manapercent or 100
ak.healthpercent = ak.healthpercent or 100
ak.currentmana = ak.currentmana or 5000
ak.maxmana = ak.maxmana or 5000
ak.currenthealth = ak.currenthealth or 5000
ak.maxhealth = ak.maxhealth or 5000
ak.bleeding = ak.bleeding or 0
ak.eatsbetweenaffs = 0

ak.aliases = ak.aliases or {}
ak.aliases.lastsend = ak.aliases.lastsend or {}
ak.queue = ak.queue or {}
ak.queue.eqbal = ak.queue.eqbal or {}
ak.queue.sent = {}

ak.pervasion = ak.pervasion or {}
ak.pervasion.initialbleed = false
ak.duress = ak.duress or {}
ak.ignition = ak.ignition or {}
ak.serpent = ak.serpent or {}
ak.dragon = ak.dragon or {}
ak.firelord = ak.firelord or {}
ak.firelord.spark = ak.firelord.spark or 0
ak.priest = ak.priest or {}
ak.shaman = ak.shaman or {}
ak.knight = ak.knight or {}
ak.monk = ak.monk or {}
ak.jester = ak.jester or {}
ak.occie = ak.occie or {}
ak.alchemist = ak.alchemist or {}
ak.bard = ak.bard or {}
ak.magi = ak.magi or {}
ak.sentinel = ak.sentinel or {}
ak.depthswalker = ak.depthswalker or {}
ak.SnB = ak.SnB or {}
ak.dwc = ak.dwc or {}
ak.dwb = ak.dwb or {}
ak.bm = ak.bm or {}
ak.sylvan = ak.sylvan or {}
ak.shaman.coagulation = true
ak.shaman.bloodlet = true
ak.shaman.relapse = true
ak.jinxcount = ak.jinxcount or 0
ak.timers = ak.timers or {}
ak.occie = ak.occie or {}
ak.occie.aura = ak.occie.aura or {}
ak.occie.aura.physical = ak.occie.aura.physical or 0
ak.occie.aura.mental = ak.occie.aura.mental or 0
ak.occie.aura.unknownparse = ak.occie.aura.unknownparse or {}
ak.apostate = ak.apostate or {}
ak.shikudo = ak.shikudo or {}
ak.psion = ak.psion or {}
ak.psion.unweaving = ak.psion.unweaving or {}
ak.psion.unweaving.mind = ak.psion.unweaving.mind or 0
ak.psion.unweaving.body = ak.psion.unweaving.body or 0
ak.psion.unweaving.spirit = ak.psion.unweaving.spirit or 0
ak.mounted = false
ak.kata = ak.kata or 0
ak.twoh = ak.twoh or {}
ak.twoh.skull = 0
ak.twoh.ribs = 0
ak.twoh.tendons = 0
ak.twoh.wrist = 0
ak.twoh.modifier = 1
ak.twoh.salveconversion = {
   ["arms"] = "wrist",
   ["legs"] = "tendons",
   ["head"] = "skull",
   ["torso"] = "ribs",
}
ak.track = ak.track or {}
ak.slickfucks = ak.slickfucks or {}
ak.burstfucks = ak.burstfucks or {}
ak.alchemist = ak.alchemist or {}
ak.alchemist.humour = ak.alchemist.humour or {}
ak.alchemist.humour.sanguine = 0
ak.alchemist.humour.choleric = 0
ak.alchemist.humour.melancholic = 0
ak.alchemist.humour.phlegmatic = 0
ak.magi = ak.magi or {}
ak.magi.vibes = ak.magi.vibes or {
   ["Alarm"] = 0,
   ["Grounding"] = 0,
   ["Heat"] = 0,
   ["Creeps"] = 0,
   ["Dissipate"] = 0,
   ["Revelation"] = 0,
   ["Gravity"] = 0,
   ["Silence"] = 0,
   ["Harmony"] = 0,
   ["Energise"] = 0,
   ["Palpitation"] = 0,
   ["Adduction"] = 0,
   ["Stridulation"] = 0,
   ["Forest"] = 0,
   ["Tremors"] = 0,
   ["Disorientation"] = 0,
   ["Dissonance"] = 0,
   ["Oscillate"] = 0,
   ["Lullaby"] = 0,  
   ["Plague"] = 0, 
   ["Reverberation"] = 0,
}
ak.balancemodifier = ak.balancemodifier or "nimble"
ak.kata = ak.kata or 0
ak.bals = {}
ak.bals.salve = true
ak.bals.focus = true
ak.defs = ak.defs or {}
ak.defs.mass = false
ak.defs.shield = false
ak.defs.rebounding = false
affstrack = {
        venoms = {
                ["xentio"]     = "clumsiness",
                ["eurypteria"] = "recklessness",
                ["kalmia"]     = "asthma",
                ["delphinium"] = "sleep",
                ["digitalis"]  = "shyness",
                ["darkshade"]  = "darkshade",
                ["curare"]     = "paralysis",
                ["epteth"]     = "crippledarm",
                ["prefarar"]   = "sensitivity",
                ["monkshood"]  = "disloyalty",
                ["euphorbia"]  = "nausea",
                ["colocasia"]  = "deafblind",
                ["vernalius"]  = "weariness",
                ["epseth"]     = "crippledleg",
                ["larkspur"]   = "dizziness",
                ["slike"]      = "anorexia",
                ["notechis"]   = "haemophilia",
                ["vardrax"]    = "addiction",
                ["aconite"]    = "stupidity",
                ["selarnia"]   = "selarnia",
                ["gecko"]      = "slickness",
                ["scytherus"]  = "scytherus",
                ["voyria"]     = "voyria",
                ["pothealthleech"]= "healthleech",
                ["potloneliness"] = "loneliness",
                ["potepilepsy"]   = "epilepsy"
        },
 
        applied = {
                ["body"]  = {"anorexia","frozen","aflame","selarnia"},
                ["skin"]  = {"anorexia", "crippledarm", "crippledleg","frozen","selarnia"},
                ["torso"] = {"anorexia", "torso", "aflame", "hypothermia","selarnia"},
                ["head"]  = {"stuttering","head","crushedthroat"},
                ["arms"]  = {"crippledarm", "rightarm", "leftarm"},
                ["legs"]  = {"crippledleg","rightleg","leftleg"},
                ["ears"]  = {"scalded","head"}
        }, 
        eaten = {
                ["piece of kelp"]    = {"asthma", "clumsiness", "hypochondria", "sensitivity", "weariness", "healthleech", "parasite"},
                ["aurum flake"]      = {"asthma", "clumsiness", "hypochondria", "sensitivity", "weariness", "healthleech", "parasite"},
                ["lobelia seed"]     = {"tenderskin", "spiritburn", "agoraphobia", "claustrophobia", "loneliness", "masochism", "recklessness", "vertigo", "spiritdisrupt", "airdisrupt", "earthdisrupt", "firedisrupt", "waterdisrupt"},
                ["argentum flake"]   = {"tenderskin", "spiritburn", "agoraphobia", "claustrophobia", "loneliness", "masochism", "recklessness", "vertigo", "spiritdisrupt", "airdisrupt", "earthdisrupt", "firedisrupt", "waterdisrupt"},
                ["prickly ash bark"] = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"},
                ["stannum flake"]    = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"},
                ["bellwort flower"]  = {"retribution","timeloop","generosity", "pacifism","justice","lovers"},
                ["cuprum flake"]     = {"retribution","timeloop","generosity", "pacifism","justice","lovers"},
                ["bayberry bark"]    = {"blind"},
                ["arsenic pellet"]   = {"blind"},
                ["hawthorn berry"]   = {"deaf"},
                ["calamine crystal"] = {"deaf"},
                ["goldenseal root"]  = {"dizziness", "epilepsy", "impatience", "shyness", "stupidity", "depression", "shadowmadness"},
                ["plumbum flake"]    = {"dizziness", "epilepsy", "impatience", "shyness", "stupidity", "depression", "shadowmadness"},
                ["bloodroot leaf"]   = {"paralysis", "slickness"},
                ["magnesium chip"]   = {"paralysis", "slickness"},
                ["ginseng root"]     = {"addiction", "darkshade", "haemophilia", "lethargy", "nausea", "scytherus"},
                ["ferrum flake"]     = {"addiction", "darkshade", "haemophilia", "lethargy", "nausea", "scytherus"},
                ["rage"]             = {"timeloop","generosity", "pacifism","justice"},
                ["prickly pear"]     = {"pressure"},
								["calcite mote"]     = {"pressure"},
        },

        focused = {
								"stuttering",
                "lovers",
                "agoraphobia",
                "anorexia",
                "claustrophobia",
                "confusion",
                "dizziness",
                "epilepsy",
                "generosity",
                "loneliness",
                "masochism",
                "pacifism",
                "recklessness",
                "shyness",
                "stupidity",
                "vertigo",
                "airdisrupt",
                "firedisrupt",
                "waterdisrupt",
                "paranoia",
                "dementia",
                "hallucinations",            
        },

        treed = {
								"crushedthroat",
								"stuttering",
                "aeon",
                "healthleech",
                "haemophilia",
                "clumsiness",
                "aflame",
                "paranoia",
                "vertigo",
                "agoraphobia",
                "dizziness",
                "claustrophobia",
                "recklessness",
                "epilepsy",
                "addiction",
                "stupidity",
                "scytherus",
                "slickness",
                "generosity",
                "justice",
                "pacifism",
                "confusion",
                "voyria",
                "weariness",
                "hallucinations",
                "confusion",
                "disloyalty",
                "lethargy",
                "shyness",
                "sensitivity",
                "asthma",
                "crippledarm",
                "crippledleg",
                "darkshade",
                "impatience",
                "anorexia",
                "loneliness",
                "hypochondria", 
                "selarnia",
                "leftleg",
                "leftarm",
                "rightleg",
                "rightarm",
                "frozen",
                "airdisrupt",
                "earthdisrupt",
                "firedisrupt",
                "spiritdisrupt",
                "waterdisrupt",
                "hellsight",
                "nausea",
                "lovers",
                "parasite",
                "retribution",
                "depression",
                "shadowmadness",
								"timeloop",
								"manaleech",
								"tension",
								"unweavingspirit",
								"unweavingmind",
								"unweavingbody",
                "tenderskin", 
                "spiritburn", 
        },
 
        restored = {
                "crippledarm",
                "crippledleg",
                "rightleg",
                "leftleg",
                "rightarm",
                "leftarm",              
        },
 
        smoked = {
                "deadening",
                "disloyalty",
                "slickness",
                "manaleech",
                "aeon",
                "hellsight",
								"tension",
								"unweavingspirit",
        },

        score = {
                ["addiction"]      = 0,
                ["aeon"]           = 0,
                ["agoraphobia"]    = 0,
                ["anorexia"]       = 0,
                ["aflame"]         = 0,
                ["amnesia"]        = 0,
                ["armexpend"]      = 0,
                ["airfist"]        = 0,
                ["asthma"]         = 0,
                ["bitten"]         = 0,
                ["blind"]          = 0,
                ["blackout"]       = 0,
								["bloodfire"]      = 0,
                ["blisters"]       = 0,
                ["bound"]          = 0,
                ["brand"]          = 0,
                ["claustrophobia"] = 0,
                ["clumsiness"]     = 0,
                ["conflagrate"]    = 0,
                ["confusion"]      = 0,
								["corruption"]     = 0,
                ["crippledarm"]    = 0,
                ["crippledleg"]    = 0,
                ["crushedthroat"]  = 0,
                ["darkshade"]      = 0,
                ["deadening"]      = 0,
                ["deaf"]           = 0,
                ["dementia"]       = 0,
                ["depression"]     = 0,
                ["dehydrate"]      = 0,
                ["disloyalty"]     = 0,
                ["disrupt"]        = 0,
                ["dizziness"]      = 0,
                ["enlighten"]      = 0,
                ["epilepsy"]       = 0,
                ["frozen"]         = 0,
                ["generosity"]     = 0,
                ["guilt"]          = 0,
                ["haemophilia"]    = 0,
                ["hallucinations"] = 0,
                ["hamstring"]      = 0,
                ["hierophant"]     = 0,
                ["healthleech"]    = 0,
                ["hellsight"]      = 0,
                ["hypersomnia"]    = 0,
                ["hypochondria"]   = 0,
                ["hypothermia"]    = 0,
                ["impaleslash"]    = 0,
                ["impatience"]     = 0,
                ["inquisition"]    = 0,
                ["insomnia"]       = 0,
                ["justice"]        = 0,
                ["kola"]           = 0,
                ["latched"]        = 0,
                ["lethargy"]       = 0,
                ["lovers"]         = 0,
                ["loneliness"]     = 0,
                ["masochism"]      = 0,
                ["manaleech"]      = 0,
                ["mindclamp"]      = 0,
								["mindravaged"]    = 0,
                ["nausea"]         = 0,
                ["pacifism"]       = 0,
                ["paralysis"]      = 0,
                ["parasite"]       = 0,
                ["paranoia"]       = 0,
                ["petrified"]      = 0,
                ["prone"]          = 0,
								["preempt"]        = 0,
                ["recklessness"]   = 0,
                ["retribution"]    = 0,
                ["rixil"]          = 0,
                ["scalded"]        = 0,
                ["scytherus"]      = 0,
                ["selarnia"]       = 0,
                ["sensitivity"]    = 0,
                ["shadowmadness"]  = 0,
                ["shyness"]        = 0,
                ["slime"]          = 0,
                ["slickness"]      = 0,
                ["tempslickness"]  = 0,
                ["sleep"]          = 0,
                ["spiritburn"]     = 0,
                ["stupidity"]      = 0,
								["stuttering"]     = 0,
                ["surge"]          = 0,
                ["transfixed"]     = 0,
                ["tenderskin"]     = 0,
                ["timeflux"]       = 0,
                ["timeloop"]       = 0,
                ["trussed"]        = 0,
                ["unconscious"]     = 0,
                ["weariness"]      = 0,
                ["wrenchhead"]     = 0,
                ["wrenchtorso"]     = 0,
                ["whisperingmadness"] = 0,
                ["worm"]           = 0,
                ["vertigo"]        = 0,
                ["vitiate"]        = 0,
                ["voidfist"]       = 0,
                ["voyria"]         = 0,
                ["airdisrupt"]     = 0,
                ["earthdisrupt"]   = 0,
                
                ["trussed"]        = 0,
                ["unconscious"]    = 0,    
                ["firedisrupt"]    = 0,
                ["spiritdisrupt"]  = 0,
                ["waterdisrupt"]   = 0,
                ["rightleg"]       = 0,
                ["leftleg"]       = 0,
                ["rightarm"]       = 0,
                ["leftarm"]       = 0,
                ["head"]       = 0,
                ["torso"]       = 0,
								["tension"]     = 0,
								["pressure"]    = 0,
								["unweavingbody"] = 0,
								["unweavingmind"] = 0,
								["unweavingspirit"] = 0,
        },
 
        cureall = {
								"crushedthroat",
								"stuttering",
                "addiction",
                "aflame",
                "agoraphobia",
                "anorexia",
                "asthma",
                "claustrophobia",
                "clumsiness",
                "confusion",
                "crippledarm",
                "crippledleg",   
                "darkshade",     
                "deadening",                
                "dementia",      
                "disloyalty",     
                "disrupt",       
                "dizziness",      
                "epilepsy",     
                "generosity",     
                "haemophilia",    
                "hallucinations", 
                "healthleech",
                "hellsight",
                "hypersomnia",    
                "hypochondria",   
                "impatience",     
                "lethargy",       
                "loneliness", 
                "lovers",
                "manaleech",    
                "masochism",  
                "nausea",    
                "pacifism",       
                "paralysis",      
                "paranoia",       
                "recklessness",   
                "scytherus",    
                "selarnia",    
                "sensitivity",   
                "shyness",      
                "slickness",    
                "stupidity",     
                "weariness",     
                "vertigo",        
                "voyria",
								"tension",
								"pressure",
								"unweavingbody", 
								"unweavingmind", 
								"unweavingspirit",
                },
}
affstrack.hypo = {
   [1] = "nausea",
   [2] = "addiction",
   [3] = "lethargy",
}
affstrack.crushedpots = {
   ["piece of kelp"]   = "pothealthleech",
   ["bellwort flower"] = "vernalius",
   ["valerian leaf"]   = "gecko",
   ["lobelia seed"]    = "potloneliness",
   ["piece of slippery elm"] = "larkspur",
   ["kola nut"]        = "delphinium",
   ["goldenseal root"] = "potepilepsy",
   ["hawthorn berry"]  = "prefarar",
}

affstrack.physicallist = {"asthma","sensitivity","healthleech","haemophilia","clumsiness","darkshade","slickness","paralysis"}
affstrack.mentallist = {"addiction","dementia","stupidity","confusion","hypersomnia","paranoia","hallucinations","impatience","recklessness","masochism","agoraphobia","loneliness","lovers"}
affstrack.whisperlist = {"addiction","dementia","stupidity","confusion","hypersomnia","paranoia","hallucinations","impatience","recklessness","masochism","agoraphobia","loneliness","lovers"}
affstrack.enlightenlist = {"whisperingmadness","vertigo","dementia","stupidity","confusion","hypersomnia","paranoia","hallucinations","impatience","recklessness","masochism","agoraphobia","loneliness","lovers","dizziness","anorexia","hypochondria","claustrophobia"}
affstrack.smokelist = {"manaleech","deadening","disloyalty"}
affstrack.enlightenscore = 0
affstrack.accentatoscore = 0
affstrack.ginsengscore = 0
affstrack.pyradiusscore = 0
affstrack.goldenscore = 0
affstrack.kelpscore = 0
affstrack.mentalscore = 0
affstrack.totalaffs = 0
affstrack.impale = false
ak.randomaffs = 0
cecho("\n<LimeGreen>[<DodgerBlue>AK<LimeGreen>]: <snow>Loaded Module: AK Opponent Tracking!!")
