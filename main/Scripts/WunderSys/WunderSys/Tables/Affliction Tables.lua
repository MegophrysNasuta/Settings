-- RESTORATION AI TABLE
wsys.tb.restorationlist = {}

wsys.tb.justreckless = {}

-- LIST OF CURRENT AFFS
wsys.aff = wsys.aff or {}


-- CURES FOR EACH AFF
wsys.tb.affc = {

 burning = {"mendingtorso"},
 addiction = {"ginseng", "ferrum"},
 aeon = {"elm", "cinnabar"},
 agoraphobia = {"lobelia", "argentum", "focus"},
 anorexia = {"epidermalbody", "focus"},
 sleeping = {"wake"},
 asthma = {"kelp", "aurum", "fitness"},
 concussion = {"restorationhead"},
 damagedhead = {"restorationhead"},
 blackout = {},
 bleeding = {"clot"},
 damagedleftarm = {"restorationarms"},
 damagedleftleg = {"restorationlegs"},
 damagedrightarm = {"restorationarms"},
 damagedrightleg = {"restorationlegs"},
 mildtrauma = {"restorationtorso"},
 carm = {"mendingarms", "restore"},
 claustrophobia = {"lobelia", "argentum", "focus"},
 brokenleftarm = {"mendingarms", "restore"},
 brokenleftleg = {"mendinglegs", "restore"},
 cleg = {"mendinglegs", "restore"},
 climb = {"mendingskin","restore"},
 clumsiness = {"kelp", "aurum"},
 confusion = {"ash", "stannum","focus"},
 concussion = {"restorationhead"},
 crushedthroat = {"mendinghead"},
 brokenrightarm = {"mendingarms", "restore"},
 brokenrightleg = {"mendinglegs", "restore"},
 darkshade = {"ginseng", "ferrum"},
 dazed = {"elm", "cinnabar"},
 deadening = {"elm", "cinnabar"},
 dementia = {"ash", "stannum", "focus"},
 depression = {"goldenseal", "plumbum"},
 disloyalty = {"valerian", "realgar"},
 disrupted = {"concentrate"},
 dissonance = {"goldenseal", "plumbum"},
 dizziness = {"goldenseal", "plumbum", "focus"},
 epilepsy = {"goldenseal", "plumbum", "focus"},
 fear = {"compose"},
 frozen = {"caloric"},
 generosity = {"bellwort", "cuprum", "rage"},
 hamstrung = {}, -- timed
 haemophilia = {"ginseng", "ferrum"},
 hallucinations = {"ash", "stannum", "focus"},
 healthleech = {"kelp", "aurum"},
 heartseed = {"restorationtorso"},
 hellsight = {"valerian", "realgar"},
 hypersomnia = {"ash", "stannum"},
 hypochondria = {"kelp", "aurum"},
 impaled = {"writhe"},
 impatience = {"goldenseal", "plumbum"},
 inquisition = {},
 hecatecurse = {},
 bubonis = {},
 weakenedmind = {"focus"},
 itching = {"epidermalbody"},
 laceratedthroat = {"restorationhead"},
 lethargy = {"ginseng", "ferrum"},
 loneliness = {"lobelia", "argentum", "focus"},
 lovers = {"bellwort", "cuprum", "focus", "rage"},
 justice = {"bellwort", "cuprum", "rage"},
 whisperingmadness = {"elm", "cinnabar"},
 manaleech = {"valerian", "realgar"},
 masochism = {"lobelia", "argentum", "focus"},
 mangledhead = {"restorationhead"},
 mangledleftarm = {"restorationarms"},
 mangledleftleg = {"restorationlegs"},
 mangledrightarm = {"restorationarms"},
 mangledrightleg = {"restorationlegs"},
 serioustrauma = {"restorationtorso"},
 nausea = {"ginseng", "ferrum"},
 pacified = {"bellwort", "cuprum", "focus", "rage"},
 paralysis = {"bloodroot", "magnesium"},
 paranoia = {"ash", "stannum", "focus"},
 parasite = {"kelp", "aurum"},
 peace = {"bellwort", "cuprum", "rage"},
 prone = {"stand"},
 recklessness = {"lobelia", "argentum", "focus"},
 retribution = {"bellwort", "cuprum"},
 scytherus = {"ginseng", "ferrum"},
 sensitivity = {"kelp", "aurum"},
 selarnia = {"mendingtorso"},
 daeggerimpale = {"writhe"},
 shadowmadness = {"goldenseal", "plumbum"},
 shivering = {"caloric"},
 shyness = {"goldenseal", "plumbum", "focus"},
 slashedthroat = {"epidermalhead"},
 slickness = {"bloodroot", "magnesium", "valerian", "realgar"},
 speared = {"writhe"},
 stupidity = {"goldenseal", "plumbum", "focus"},
 stuttering = {"epidermalhead", "focus"},
 entangled = {"writhe", "flex"},
 bound = {"writhe"},
 timeloop = {"bellwort", "cuprum"},
 transfixation = {"writhe"},
 weariness = {"kelp", "aurum"},
 webbed = {"writhe", "flex"},
 vertigo = {"lobelia", "argentum", "focus"},
 voyria = {"immunity", "antigen"},

 waterdisrupt = {"focus", "lobelia", "argentum"},
 airdisrupt = {"focus", "lobelia", "argentum"},
 firedisrupt = {"focus", "lobelia", "argentum"},
 earthdisrupt = {"lobelia", "argentum"},
 spiritdisrupt = {"lobelia", "argentum"},
 
 guilt = {"lobelia", "argentum"},
 tenderskin = {"lobelia", "argentum"},
 spiritburn = {"lobelia", "argentum"},

 temperedcholeric = {"ginger", "antimony"},
 temperedmelancholic = {"ginger", "antimony"},
 temperedphlegmatic = {"ginger", "antimony"},
 temperedsanguine = {"ginger", "antimony"},

 corruption = {}, --45s

 skullfractures = {"healthhead", "restore"},
 crackedribs = {"healthtorso", "restore"},
 wristfractures = {"healtharms", "restore"},
 torntendons = {"healthlegs", "restore"},

 hypothermia = {"restorationtorso"},
 scalded = {"epidermalhead"},
 dehydrated = {}, --60s
 timeflux = {}, --60s
 
 unweavingmind = {"goldenseal", "plumbum"},
 unweavingbody = {"ginseng", "ferrum"},
 unweavingspirit = {"elm", "cinnabar"},
 
 tension = {"elm", "cinnabar"},
 pressure = {"pear", "calcite"}

}

wsys.tb.affctype = {

 addiction = "herb",
 aeon = "smoke",
 agoraphobia = "herb",
 anorexia = "salve",
 sleeping = "wake",
 asthma = "herb",
 burning = "salve",
 concussion = "salve",
 damagedhead = "salve",
 damagedleftarm = "salve",
 damagedleftleg = "salve",
 damagedrightarm = "salve",
 damagedrightleg = "salve",
 mildtrauma = "salve",
 claustrophobia = "herb",
 brokenleftarm = "salve",
 brokenleftleg = "salve",
 clumsiness = "herb",
 confusion = "herb",
 concussion = "salve",
 crushedthroat = "salve",
 brokenrightarm = "salve",
 brokenrightleg = "salve",
 darkshade = "herb",
 dazed = "smoke",
 deadening = "smoke",
 dementia = "herb",
 depression = "herb",
 disloyalty = "smoke",
 disrupted = "concentrate",
 dissonance = "herb",
 dizziness = "herb",
 epilepsy = "herb",
 fear = "compose",
 frozen = "salve",
 generosity = "herb",
 haemophilia = "herb",
 hallucinations = "herb",
 healthleech = "herb",
 heartseed = "salve",
 hellsight = "smoke",
 hypersomnia = "herb",
 hypochondria = "herb",
 impaled = "writhe",
 impatience = "herb",
 itching = "salve",
 lethargy = "herb",
 loneliness = "herb",
 lovers = "herb",
 justice = "herb",
 whisperingmadness = "smoke",
 laceratedthroat = "salve",
 slashedthroat = "salve",
 manaleech = "smoke",
 masochism = "herb",
 mangledhead = "salve",
 mangledleftarm = "salve",
 mangledleftleg = "salve",
 mangledrightarm = "salve",
 mangledrightleg = "salve",
 serioustrauma = "salve",
 nausea = "herb",
 pacified = "herb",
 paralysis = "herb",
 paranoia = "herb",
 parasite = "herb",
 peace = "herb",
 prone = "stand",
 recklessness = "herb",
 retribution = "herb",
 scytherus = "herb",
 sensitivity = "herb",
 selarnia = "salve",
 daeggerimpale = "writhe",
 shadowmadness = "herb",
 shivering = "salve",
 shyness = "herb",
 slickness = "smoke",
 speared = "writhe",
 stupidity = "herb",
 stuttering = "salve",
 entangled = "writhe",
 bound = "writhe",
 timeloop = "herb",
 transfixation = "writhe",
 weariness = "herb",
 webbed = "writhe",
 vertigo = "herb",
 voyria = "immunity",

 waterdisrupt = "herb",
 airdisrupt = "herb",
 firedisrupt = "herb",
 earthdisrupt = "herb",
 spiritdisrupt = "herb",
 
 guilt = "herb",
 tenderskin = "herb",
 spiritburn = "herb",

 temperedcholeric = "herb",
 temperedmelancholic = "herb",
 temperedphlegmatic = "herb",
 temperedsanguine = "herb",


 skullfractures = "health",
 crackedribs = "health",
 wristfractures = "health",
 torntendons = "health",

 hypothermia = "salve",
 scalded = "salve",
 
 pressure = "smoke",
 tension = "smoke",
 
 unweavingbody = "herb",
 unweavingmind = "herb",
 unweavingspirit = "smoke",
 

}





-- AFFS RECEIVED TOGETHER FOR AI PURPOSES
wsys.tb.affspaired = {}


-- AFFS RECEIVED BETWEEN SAME PROMPTS
wsys.tb.affstogether = {}

-- Removed Weariness from Focusable - Announce 4494
-- Dementia, Paranoia, and Hallucination - Added as Focusable Announce #4539 
-- CURES
wsys.tb.cures = {

 bloodroot = {"paralysis", "slickness"},
 magnesium = {"paralysis", "slickness"},
 lobelia = {"agoraphobia", "claustrophobia", "loneliness", "masochism", "vertigo", "recklessness","spritidisrupt", "guilt", "tenderskin", "spiritburn"},
 argentum = {"agoraphobia", "claustrophobia", "loneliness", "masochism", "vertigo", "recklessness","spiritdisrupt", "guilt", "tenderskin", "spiritburn"},
 kelp = {"asthma", "clumsiness", "sensitivity", "weariness", "hypochondria", "healthleech", "parasite"},
 aurum = {"asthma", "clumsiness", "sensitivity", "weariness", "hypochondria", "healthleech", "parasite"},
 ginseng = {"darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", "unweavingbody"},
 ferrum = {"darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", "unweavingbody"},
 bellwort = {"generosity", "lovers", "justice", "pacified", "peace", "retribution", "timeloop"},
 cuprum = {"generosity", "lovers", "justice", "pacified", "peace", "retribution", "timeloop"},
 ash = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"},
 stannum = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"},
 goldenseal = {"stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "retribution", "timeloop", "unweavingmind"},
 plumbum = {"stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "retribution", "timeloop", "unweavingmind"},
 focus = {"stupidity", "dizziness", "confusion", "claustrophobia", "agoraphobia", "masochism", "lovers", "recklessness", 
          "epilepsy", "loneliness", "shyness", "pacified", "anorexia", "vertigo", "weakenedmind",
			"waterdisrupt", "earthdisrupt", "firedisrupt","airdisrupt", "dementia", "hallucinations", "paranoia"},
 elm = {"aeon", "whisperingmadness", "deadening", "dazed", "tension", "unweavingspirit" },
 cinnabar = {"aeon", "whisperingmadness", "deadening", "dazed", "tension", "unweavingspirit" },
 valerian = {"slickness", "disloyalty", "manaleech", "hellsight"},
 realgar = {"slickness", "disloyalty", "manaleech", "hellsight"},
 mendinglegs = {"brokenleftleg", "brokenrightleg", "cleg"},
 mendingarms = {"brokenleftarm", "brokenrightarm", "carm"},
 mendingskin = {"climb", "brokenleftleg", "brokenrightleg", "cleg", "brokenrightarm", "brokenleftarm", "brokenarm"},
 epidermalbody = {"anorexia", "itching"},
 epidermalhead = {"scalded"},
 mendingbody = {"burning", "selarnia"},
 mendinghead = {"crushedthroat"},
 mendingtorso = {"selarnia"},
 epidermalhead = {"stuttering", "slashedthroat"},
 caloric = {"shivering", "frozen"},
 restorationarms = {"damagedleftarm", "damagedrightarm", "mangledleftarm", "mangledrightarm", "bleg"},
 restorationlegs = {"damagedleftleg", "damagedrightleg", "mangledleftleg", "mangledrightleg", "bleg"},
 restorationhead = {"damagedhead", "mangledhead", "laceratedthroat", "concussion"},
 restorationtorso = {"mildtrauma", "serioustrauma", "heartseed"},
 restorationbody = {"hypothermia"},
 tree = {"brokenleftarm", "brokenrightarm", "brokenleftleg", "brokenrightleg", "paralysis", "slickness", "agoraphobia", "claustrophobia", 
          "loneliness", "masochism", "vertigo", "recklessness", "asthma", "clumsiness", "sensitivity", "weariness", 
          "hypochondria", "healthleech", "darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", 
          "generosity", "lovers", "justice", "pacified", "peace", "confusion", "dementia", "hallucinations", "hypersomnia", 
          "paranoia", "stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "slickness", "disloyalty",
          "aeon", "whisperingmadness", "hellsight", "deadening", "burning", "stuttering", "carm", "cleg", "anorexia", "voyria", 
			    "parasite", "depression", "shadowmadness", "retribution", "timeloop", "crushedthroat", "guilt", "spiritburn", "tenderskin" },
 shrugging = {"brokenleftarm", "brokenrightarm", "brokenleftleg", "brokenrightleg", "paralysis", "slickness", "agoraphobia", "claustrophobia", 
          "loneliness", "masochism", "vertigo", "recklessness", "asthma", "clumsiness", "sensitivity", "paralysis", 
          "hypochondria", "healthleech", "darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", 
          "generosity", "lovers", "justice", "pacified", "peace", "confusion", "dementia", "hallucinations", "hypersomnia", 
          "paranoia", "stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "slickness", "disloyalty",
          "aeon", "whisperingmadness", "hellsight", "deadening", "burning", "stuttering", "carm", "cleg", "anorexia", "voyria",
          "parasite", "depression", "shadowmadness", "retribution", "timeloop", "crushedthroat"},
 restore = {"brokenleftarm", "brokenrightarm", "brokenleftleg", "brokenrightleg", "carm", "cleg"},
 dheal = {"brokenleftarm", "brokenrightarm", "brokenleftleg", "brokenrightleg", "paralysis", "slickness", "agoraphobia", "claustrophobia", 
          "loneliness", "masochism", "vertigo", "recklessness", "asthma", "clumsiness", "sensitivity", "weariness", 
          "hypochondria", "healthleech", "darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", 
          "generosity", "lovers", "justice", "pacified", "peace", "confusion", "dementia", "hallucinations", "hypersomnia", 
          "paranoia", "stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "slickness", "disloyalty",
          "aeon", "whisperingmadness", "hellsight", "deadening", "burning", "stuttering", "carm", "cleg", "anorexia", "voyria",
          "parasite", "depression", "shadowmadness", "retribution", "timeloop", "crushedthroat", "guilt", "spiritburn", "tenderskin"},
 flex = {"webbed", "entangled"},
 writhe = {"webbed", "entangled", "bound", "impaled", "transfixation", "speared", "daeggerimpale"},
 fool = {"brokenleftarm", "brokenrightarm", "brokenleftleg", "brokenrightleg", "paralysis", "slickness", "agoraphobia", "claustrophobia", 
          "loneliness", "masochism", "vertigo", "recklessness", "asthma", "clumsiness", "sensitivity", "weariness", 
          "hypochondria", "healthleech", "darkshade", "scytherus", "addiction", "lethargy", "haemophilia", "nausea", 
          "generosity", "lovers", "justice", "pacified", "peace", "confusion", "dementia", "hallucinations", "hypersomnia", 
          "paranoia", "stupidity", "impatience", "dizziness", "epilepsy", "dissonance", "shyness", "slickness", "disloyalty",
          "aeon", "whisperingmadness", "hellsight", "deadening", "burning", "stuttering", "carm", "cleg", "anorexia", "voyria",
          "parasite", "depression", "shadowmadness", "retribution", "timeloop", "crushedthroat", "guilt", "spiritburn", "tenderskin"},
 concentrate = {"disrupted"},
 compose = {"fear"},
 clot = {"bleeding"},
 immunity = {"voyria"},
 fitness = {"asthma"},
 rage = {"generosity", "justice", "lovers", "pacified", "peace"},
 antimony = { "temperedcholeric", "temperedmelancholic", "temperedphlegmatic", "temperedsanguine"},
 ginger = { "temperedcholeric", "temperedmelancholic", "temperedphlegmatic", "temperedsanguine"},
 healthhead = {"skullfractures"},
 healthtorso = {"crackedribs"},
 healtharms = {"wristfractures"},
 healthlegs = {"torntendons"},
}

wsys.tb.targettedCureTable = {
  "mendingtorso", "renewaltorso",
  "ginseng", "ferrum",
  "bloodroot", "magnesium",
  "elm", "cinnabar",
  "valerian", "realgar",
  "ginger", "antimony",
  "bellwort", "cuprum",
  "lobelia", "argentum",
  "epidermalbody", "sensorybody",
  "kelp", "aurum",
  "ash", "stannum",
  "restorationarms", "reconstructivearms",
  "restorationhead", "reconstructivehead",
  "restorationlegs", "reconstructivelegs",
  "restorationtorso", "reconstructivetorso",
  "epidermalbody", "sensorybody",
  "mendingarms", "renewalarms",
  "mendinglegs", "renewallegs",
  "mendingbody", "renewalbody",
  "epidermalhead", "sensoryhead",
  "calorictorso", "exothermictorso",
  "goldenseal", "plumbum",
}