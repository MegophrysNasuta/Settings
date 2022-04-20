-- dreadpilar 6
-- yggdrasiltablet 18
-- shapingtome 25
-- firecrystal 37
-- nexuscube 37
-- snakeskin 125
-- criersbell 200

talisman = talisman or {}

talisman.setorder = {"dragon", "azatlan", "wonders", "miscellane", "historical", "conclave", "marks", "seafaring", "death", "blackwave", "races", "forays", "cities", "monks", "elemental", "yggdrasil", "contenders", "underworld", "renegades", "invasion", "war", "planes", "eldergod"}

-- Order is optional, if not present it will be a random order as the talisman.info tables is unsorted.
talisman.setformat = {
	dragon = {titlewidth = 7, cellwidth = 7},
	azatlan = {titlewidth = 10, cellwidth = 6, order = {"eagleheaddress", "coati", "kinkajou", "quetzal", "transoceanic", "atlatl", "azatlanknife"}},
	wonders = {titlewidth = 10, cellwidth = 7, order = {"baitbucket", "dragonskinpack", "platinumwhistle", "ramshorn", "monocle", "globe"}},
	miscellane = {titlewidth = 15, cellwidth = 7, order = {"hookah", "tapestry", "vaultkey", "negationsphere", "clayfigurine"}},
	historical = {titlewidth = 15, cellwidth = 7, order = {"window", "mantle", "icicle", "helmet", "disc", "votive", "whisperstone", "lily", "ozhera", "turtle", "mongoose", "hellcat"}},
	conclave = {titlewidth = 10, cellwidth = 7, value = true, order = {"tophat", "hourglass", "tempestbrooch", "elementsprite", "lesservault", "flyingring", "celerity", "buckawns", "adaptgrimoire", "stygianpendant", "grandmagi", "atavianwings"}},
	marks = {titlewidth = 10, cellwidth = 7, value = true, order = {"ivoryatlantia", "ivoryspyglass", "ivorypennon", "ivorydummy", "ivorymedallion", "ivoryarmband", "ivorytower", "ivorywarhorn", "ivorybowstring", "quisalisderillin", "quisalislookingglass", "quisalismedallion", "quisalisdummy", "quisalisbone", "quisalisarmband", "quisalistombstone", "quisalismask", "quisalisdagger", "quisaliscloak"}},
	seafaring = {titlewidth = 15, cellwidth = 10, order = {"cloverbox", "maelstrom", "islandwings", "frostpail", "neatpail", "shipchit", "xpplaque", "monstermap", "crossbow", "glassbottle", "seaweedpail", "smokeflare"}},
	death = {titlewidth = 10, cellwidth = 7, value = true, order = {"mortalcoil", "vulturetalon", "deathcandle", "deathdummy", "gravestone", "crucible", "deathscall", "deathcape"}},
	blackwave = {titlewidth = 10, cellwidth = 7, value = true, order = {"taper", "finalityring", "grievouskeyring", "goblin", "blackspigot", "sunlesshope", "blackcirclet", "guise", "jewel", "canopic", "apperceptionstone", "blackgrimoire", "suremekh'neina"}},
	races = {titlewidth = 10, cellwidth = 7, value = true, order = {"lodestone", "arachnideye", "panpipes", "chitin", "rattle", "whispercloth", "sirensong", "demolitionsphere", "catapult", "dalamyrrclaws", "frogskin", "mayafigurine"}},
	forays = {titlewidth = 10, cellwidth = 6, order = {"arankeshfeather", "icossemirror", "ogrebroth", "boulder", "margamwheel", "foraymap"}},
	cities = {titlewidth = 10, cellwidth = 7, value = true, order = {"biscuit", "tumbleweed", "celescope", "musicbox", "wraithshackles", "alabasterurn"}},
	monks = {titlewidth = 10, cellwidth = 7, value = true, order = {"monkdummy", "odysseantongue", "monkheadband", "talonedring", "cranepennon", "monkbanner", "ashstaff", "olivebranch"}},
	elemental = {titlewidth = 10, cellwidth = 7, value = true, order = {"airelement", "airbrooch", "firependant", "jawbone", "seatears", "earthenshovel", "garashshackle", "mudbomb", "searedglyph", "firetank", "sceptre", "harness"}},
	yggdrasil = {titlewidth = 13, cellwidth = 7, order = {"dreadpilar", "squargon", "yggdrasiltablet", "valdblom", "earthshapingtome", "nexuscube", "firecrystal", "planarmote", "goldensnakeskin", "yggdrasilbranch", "criersbell"}},
	contenders = {titlewidth = 10, cellwidth = 7, value = true, order = {"contenderspig", "contendersjug", "contendersbouquet", "contendersfigurine", "contendersglass", "contendersjournal", "contendersstud", "contendersribbon"}},
	underworld = {titlewidth = 10, cellwidth = 7, value = true, order = {"cryptworm", "psychesplinter", "sanityskein", "custodytalisman", "unlifetotem", "soulsliver", "funeralshroud", "cullingblade"}},
	renegades = {titlewidth = 13, cellwidth = 7, value = true, order = {"mercenarychalk", "elementalinjunction", "moppet", "turncoatscoat", "shadowcloak", "betrayersmantle", "turncoatsmasque", "sunderedpennon"}},
	invasion = {titlewidth = 13, cellwidth = 7, value = true, order = {"darkearthfigrine", "batteringram", "caltrop", "cauldron", "shadowshackle", "hagseye", "icebrick", "scoutingmap"}},
	planes = {titlewidth = 13, cellwidth = 7, value = true, order = {"cowculator", "golemgateway", "hollowbook", "brainjar", "faemirror", "celestialcoronet", "chaosclaw", "iconstatuette", "kris", "crystalsword"}},
	war = {titlewidth = 10, cellwidth = 6, value = true, order = {"rottingremains", "gildedbit", "pigeon", "warcloud", "portalhoop", "observantsigil"}},
	eldergod = {titlewidth = 10, cellwidth = 6, value = true, order = {"gaia", "lorielan", "vulnurana", "twilight", "phaestus", "scarlatti", "prospero", "aegis", "vastar"}},
}

talisman.sets = {
	eldergod = {
		gaia = {short = "blossom", order = {"cherryblossomstem", "cherryblossomflower", "cherryblossomstamen", "cherryblossomscent"}, redeem = 12, tradein = 66},
		lorielan = {short = "filter", order = {"filtercrystal", "filterbronze", "filterfitting", "filterpolish"}, redeem = 31, tradein = 166},
		vulnurana = {short = "sache", order = {"sachetcloth", "sachetherbs", "sachetstring", "sachetscent"}, redeem = 37, tradein = 200},
		twilight = {short = "hound", order = {"houndcarvingeyes", "houndcarvinglegs", "houndcarvingfangs", "houndcarvingobsidian"}, redeem = 43, tradein = 233},
		phaestus = {short = "hammer", order = {"finishinghammerhead", "finishinghammerrunes", "finishinghammerhandle", "finishinghammergrip"}, redeem = 50, tradein = 266},
		scarlatti = {short = "citole", order = {"citolestrings", "citolebody", "citolebase", "citoletune"}, redeem = 62, tradein = 333},
		prospero = {short = "pan", order = {"batteredpanhandle", "batteredpandish", "batteredpangrip", "batteredpanspell"}, redeem = 150, tradein = 800},
		aegis = {short = "declaration", order = {"declarationpaper", "declarationtext", "declarationsignature", "declarationseal"}, redeem = 187, tradein = 1000},
		vastar = {short = "wings", order = {"vastarwingfeathers", "vastarwingstraps", "vastarwingspan", "vastarwinglightning"}, redeem = 250, tradein = 1333},
	},
	dragon = {
		blackdragon = {short = "black", color = "white", order = {"blackdragonbone", "blackdragonclaw", "blackdragoneye", "blackdragonheart", "blackdragonleather", "blackdragonscale", "blackdragontooth", "blackdragonsac"}}, 
		reddragon = {short = "red", color = "red", order = {"reddragonbone", "reddragonclaw", "reddragoneye", "reddragonheart", "reddragonleather", "reddragonscale", "reddragontooth", "reddragonbelly"}}, 
		bluedragon = {short = "blue", color = "blue", order = {"bluedragonbone", "bluedragonclaw", "bluedragoneye", "bluedragonheart", "bluedragonleather", "bluedragonscale", "bluedragontooth", "bluedragonlung"}}, 
		greendragon = {short = "green", color = "green", order = {"greendragonbone", "greendragonclaw", "greendragoneye", "greendragonheart", "greendragonleather", "greendragonscale", "greendragontooth", "greendragonsac"}}, 
		golddragon = {short = "gold", color = "gold", order = {"golddragonbone", "golddragonclaw", "golddragoneye", "golddragonheart", "golddragonleather", "golddragonscale", "golddragontooth", "golddragonstem"}}, 
		silverdragon = {short = "silver", color = "LightSlateGray", order = {"silverdragonbone", "silverdragonclaw", "silverdragoneye", "silverdragonheart", "silverdragonleather", "silverdragonscale", "silverdragontooth", "silverdragonlarynx"}},
	},
	azatlan = {
		eagleheaddress = {short = "eagle", order = {"bluefeather", "greenfeather", "redfeather", "yellowfeather", "orangefeather", "purplefeather", "blackfeather"}},
		atlatl = {short = "atlatl", order = {"atlatlshaft", "atlatlcup", "atlatlspear"}},
		transoceanic = {short = "orb", order = {"orbleft", "orbright", "orbcenter"}},
		azatlanknife = {short = "knife", order = {"knifebladetop", "knifebladebottom", "knifeleather"}},
		quetzal = {short = "quetzal", order = {"quetzalbluefeather", "quetzalgreenfeather", "quetzalredfeather", "quetzalcage", "quetzaltalon", "quetzalegg"}},
		kinkajou = {short = "kinkajou", order = {"kinkajoutooth", "kinkajoucollar", "kinkajoubait", "kinkajouclaw", "kinkajoupaw", "kinkajoutail"}},
		coati = {short = "coati", order = {"coatibait", "coaticlaw", "coaticollar", "coatipaw", "coatitooth", "coatitail"}},
	},
	wonders = {
		baitbucket = {short = "bucket", order = {"buckethandle", "bucketleft", "bucketright", "bucketbase", "bucketwater"}},
		dragonskinpack = {short = "pack", order = {"packscales", "packstraps", "packlining", "packthread", "packleather"}},
		platinumwhistle = {short = "whistle", order = {"whistlemouth", "whistleflue", "whistlereed", "whistletoppipe", "whistlelowpipe"}},
		ramshorn = {short = "horn", order = {"ramshorn", "hornmouth", "hornleftstrap", "hornrightstrap", "hornfastener"}},
		monocle = {short = "monocle", order = {"monotop", "monobottom", "monoframe", "monocatch", "monoclasp"}},
		globe = {short = "globe", order = {"globetop", "globemiddle", "globebottom"}},
	},
	miscellane = {
		hookah = {short = "hookah", order = {"hookahbase", "hookahbowl", "hookahhood", "hookahchain", "hookahhoses", "hookahstem", "hookahplate"}},
		tapestry = {short = "tapestry", order = {"tapestryroller", "tapestryonyx", "tapestryvellum", "tapestryclaw"}},
		vaultkey = {short = "vaultkey", order = {"keyfragment"}},
		negationsphere = {short = "negsphere", order = {"spherefragment"}},
		clayfigurine = {short = "clayfigurine", order = {"clayfigurinebody", "clayfigurinehead", "clayfigurinelegs", "clayfigurinearms"}},
	},
	historical = {
		window = {short = "window", order = {"windowframe", "windowpane", "windowjamb", "windowshutters", "windowgrid"}},
		mantle = {short = "mantle", order = {"mantlecloth", "mantlethread", "mantlecentre", "mantlegems"}}, 
		icicle = {short = "icicle", order = {"icicletop", "iciclemiddle", "iciclebase", "icicletip", "iciclerunes"}},
		helmet = {short = "helmet", order = {"helmetskull", "helmetnose", "helmetstrap"}},
		disc = {short = "disc", order = {"disctop", "discside", "discmiddle", "discbottom", "discrunes", "disccentre"}},
		votive = {short = "votive", order = {"votivebase", "votivewick", "votivewax"}},
		whisperstone = {short = "whisperstone", order = {"stonetop", "stonebottom", "stonemiddle", "stoneside", "stonecore", "stoneemitter"}},
		lily =  {short = "lily", order = {"lilypetals", "lilystem", "lilystamen", "lilybulb", "lilypistil"}},
		ozhera =  {short = "ozhera", order = {"ozherabait", "ozheracollar", "ozheraegg", "ozheraclaw", "ozherabeak", "ozheranest"}},
		turtle =  {short = "turtle", order = {"turtleshell", "turtlebait", "turtlecollar", "turtletail", "turtlefoot", "turtletongue"}},
		mongoose =  {short = "mongoose", order = {"mongoosebait", "mongoosecollar", "mongoosetail", "mongoosepaw", "mongooseclaw", "mongoosefang"}},
		hellcat = {short = "hellcat", order = {"hellcatbait", "hellcatcollar", "hellcatclaw", "hellcatfang", "hellcattail", "hellcatpaw"}},
	},
	conclave = {
		tophat = {short = "tophat", order = {"tophatlining", "tophatbrim", "tophatthread", "tophatband"}, redeem = 3, tradein = 16},
		hourglass = {short = "hourglass", order = {"hourglasstop", "hourglassbottom", "hourglasssand", "hourglassbulb"}, redeem = 12, tradein = 66},
		tempestbrooch = {short = "brooch", order = {"broochgem", "broochclasp", "broochmetal", "broochhook"}, redeem = 18, tradein = 100},
		elementsprite = {short = "sprite", order = {"spritelegs", "spritearms", "spritetorso", "spritehead"}, redeem = 28, tradein = 150},
		lesservault = {short = "vault", order = {"vaultdoor", "vaulthinge", "vaulthandle", "vaultgems"}, redeem = 43, tradein = 233},
		flyingring = {short = "RoF", order = {"ringtop", "ringbottom", "ringinside", "ringoutside"}, redeem = 50, tradein = 266},
		celerity = {short = "celerity", order = {"armbandtop", "armbandbottom", "armbandinside", "armbandoutside"}, redeem = 62, tradein = 333},
		buckawns = {short = "buckawns", order = {"amuletthread", "amuletchain", "amuletball", "amuletclasp"}, redeem = 100, tradein = 533},
		adaptgrimoire = {short = "grimoire", order = {"grimoireleather", "grimoirepaper", "grimoiregems", "grimoirelock"}, redeem = 125, tradein = 666},
		stygianpendant = {short = "stygian", order = {"pendantbase", "pendantclasp", "pendantpearl", "pendanthook"}, redeem = 150, tradein = 800},
		grandmagi = {short = "grandmagi", order = {"robesthread", "robesneedle", "robestrim", "robesfabric"}, redeem = 312, tradein = 3000},
		atavianwings = {short = "wings", order = {"wingsthread", "wingsleft", "wingsright", "wingsfeathers"}, redeem = 250, tradein = 1333},
	},
	marks = {
		ivorywarhorn = {short = "warhorn", order = {"ivoryhornmouthpiece", "ivoryhornfittings", "ivoryhornleft", "ivoryhornright"}, redeem = 100, tradein = 533},
		ivorymedallion = {short = "ivory med", order = {"ivorymedalliondisc", "ivorymedallionclasp", "ivorymedallionaccent", "ivorymedallionribbon"}, redeem = 43, tradein = 233},
		ivoryspyglass = {short = "spyglass", order = {"ivoryspyglasslens", "ivoryspyglasseyepiece", "ivoryspyglassbody", "ivoryspyglassstrap"}, redeem = 18, tradein = 100},
		ivorypennon = {short = "pennon", order = {"ivorypennonsilk", "ivorypennonribbon", "ivorypennonthread", "ivorypennondye"}, redeem = 31, tradein = 166},
		ivoryarmband = {short = "iarmband", order = {"ivoryarmbandaccent", "ivoryarmbandouter", "ivoryarmbandinner", "ivoryarmbandclasp"}, redeem = 75, tradein = 400},
		ivoryatlantia = {short = "atlantia", order = {"ivoryatlantiabody", "ivoryatlantialegs", "ivoryatlantiahead", "ivoryatlantiaarms"}, redeem = 12, tradein = 66},
		ivorydummy = {short = "idummy", order = {"ivorydummylimbs", "ivorydummytorso", "ivorydummyclothing", "ivorydummyarmour"}, redeem = 37, tradein = 200},
		ivorytower = {short = "tower", order = {"ivorytowerbase", "ivorytowerlower", "ivorytowerupper", "ivorytowerlacquer"}, redeem = 81, tradein = 433},
		ivorybowstring = {short = "bowstring", order = {"ivorybowstringcore", "ivorybowstringwrapping", "ivorybowstringeyelet", "ivorybowstringenchant"}, redeem = 125, tradein = 666},

		quisalisdagger = {short = "anima", order = {"quisaisdaggerhilt", "quisalisdaggerblade", "quisalisdaggerpommel", "quisalisdaggergrip"}, redeem = 150, tradein = 800},
		quisalisbone = {short = "bone", order = {"quisalisbonelower", "quisalisboneupper", "quisalisbonerope", "quisalisbonestain"}, redeem = 43, tradein = 233},
		quisalismedallion = {short = "quis med", order = {"quisalismedallionchain", "quisalismedalliontop", "quisalismedallionbottom", "quisalismedallionclasp"}, redeem = 31, tradein = 166},
		quisalislookingglass = {short = "lookglass", order = {"quisalisglasscase", "quisalisglasslens", "quisalisglassiris", "quisalisglasseyepiece"}, redeem = 18, tradein = 100},
		quisalisderillin = {short = "derillin", order = {"quisalisderillinhair", "quisalisderillinclothing", "quisalisderillintorso", "quisalisderillinhead"}, redeem = 12, tradein = 66},
		quisalisdummy = {short = "qdummy", order = {"quisalisdummylimbs", "quisalisdummytorso", "quisalisdummyrobes", "quisalisdummytargets"}, redeem = 37, tradein = 200},
		quisalistombstone = {short = "tombstone", order = {"quisalistombstonetop", "quisalistombstonemiddle", "quisalistombstonebase", "quisalistombstonescript"}, redeem = 81, tradein = 433},
		quisalisarmband = {short = "qarmband", order = {"quisalisarmbandserpent", "quisalisarmbandeyes", "quisalisarmbandtop", "quisalisarmbandbottom"}, redeem = 75, tradein = 400},
		quisaliscloak = {short = "cloak", order = {"quisaliscloakcloth", "quisaliscloakembroidery", "quisaliscloaklining", "quisaliscloakhood"}, redeem = 187, tradein = 1000},
		quisalismask = {short = "deathmask", order = {"quisalismaskbone", "quisalismaskwire", "quisalismaskteeth", "quisalismaskrunes"}, redeem = 100, tradein = 533},
	},
	seafaring = {
		cloverbox = {short = "cloverbox", order = {"cloverboxclovers", "cloverboxsides", "cloverboxlid", "cloverboxbase"}},
		maelstrom = {short = "maelstrom", order = {"maelstromarms", "maelstromlegs", "maelstromhead", "maelstromtorso"}},
		islandwings = {short = "islandwings", order = {"islandwingsleft", "islandwingsright", "islandwingsthread", "islandwingsstraps"}},
		frostpail = {short = "frostpail", order = {"frostpailhandle", "frostpailleft", "frostpailright", "frostpailbase"}},
		neatpail = {short = "neatpail", order = {"neatpailhandle", "neatpailleft", "neatpailright", "neatpailbase"}},
		shipchit = {short = "shipchit", order = {"shipchittop", "shipchitbottom", "shipchitink", "shipchitseal"}},
		xpplaque = {short = "xpplaque", order = {"xpplaquemount", "xpplaquefascia", "xpplaquelacquer", "xpplaquelettering"}},
		monstermap = {short = "monstermap", order = {"monstermapink", "monstermapparchment", "monstermapcompass", "monstermapenchant"}},
		crossbow = {short = "crossbow", order = {"crossbowmount", "crossbowarms", "crossbowstring", "crossbowcrank"}},
		glassbottle = {short = "glassbottle", order = {"glassbottleneck", "glassbottlemiddle", "glassbottlebase", "glassbottleenchant"}},
		seaweedpail = {short = "seaweedpail", order = {"seaweedpailhandle", "seaweedpailleft", "seaweedpailright", "seaweedpailbase"}},
		smokeflare = {short = "flare", order = {"smokeflareshell", "smokeflarefins", "smokeflarelid", "smokeflarechamber"}},
	},
	death = {
		mortalcoil = {short = "coil", order = {"coiltop", "coilbottom", "coilstrand", "coilbinding"}, redeem = 10, tradein = 66},
		vulturetalon = {short = "talon", order = {"talontip", "talonstem", "talonbase", "talonpoison"}, redeem = 10, tradein = 66},
		deathcandle = {short = "candle", order = {"candlewax", "candleflame", "candlebase", "candlestring"}, redeem = 10, tradein = 66},
		deathdummy = {short = "dummy", order = {"deathdummyhead", "deathdummyarms", "deathdummytorso", "deathdummylegs"}, redeem = 10, tradein = 33},
		gravestone = {short = "gravestone", order = {"gravestonetop", "gravestonebottom", "gravestoneinscription", "gravestonelichen"}, redeem = 10, tradein = 264},
		crucible = {short = "crucible", order = {"cruciblebase", "cruciblehandle", "cruciblebowl", "crucibleflame"}, redeem = 10, tradein = 396},
		deathscall = {short = "call", order = {"deathscallmouth", "deathscallhorn", "deathscalltassels", "deathscallcoil"}, redeem = 10, tradein = 792},
		deathcape = {short = "cape", order = {"capebrocade", "capethread", "capeenchantment", "capevelvet"}, redeem = 10, tradein = 990},
	},
	blackwave = {
		taper = {short = "taper", order = {"tapertop", "taperbottom", "taperwax", "taperstring"}, redeem = 6, tradein = 33},
		finalityring = {short = "finality", order = {"signetband", "signetbezel", "signetcarving", "signetmarks"}, redeem = 6, tradein = 33},
		grievouskeyring = {short = "keyring", order = {"keyringlizard", "keyringtiger", "keyringslate", "keyringhoop"}, redeem = 12, tradein = 66},
		goblin = {short = "goblin", order = {"goblinlegs", "goblinarms", "goblinhead", "goblintorso"}, redeem = 16, tradein = 86},
		blackspigot = {short = "spigot", order = {"spigottop", "spigotbottom", "spigotstem", "spigottip"}, redeem = 50, tradein = 266},
		sunlesshope = {short = "sunless", order = {"sunlessband", "sunlessstone", "sunlessbinding", "sunlessenchantment"}, redeem = 75, tradein = 400},
		blackcirclet = {short = "circlet", order = {"circletfur", "circletblades", "circletband", "circletbinding"}, redeem = 106, tradein = 566},
		jewel = {short = "jewel", order = {"sanguinestone", "sanguineaura", "sanguineteardrop", "taintedblood"}, redeem = 125, tradein = 666},
		canopic = {short = "canopic", order = {"canopiclid", "canopicfluid", "canopicbase", "canopicpot"}, redeem = 125, tradein = 666},
		apperceptionstone = {short = "stone", order = {"crystalshard", "crystalbinding", "crystalportal", "crystalbase"}, redeem = 125, tradein = 666},
		guise = {short = "guise", order = {"guiseenchantment", "guisethread", "guisesmile", "guiseleather"}, redeem = 150, tradein = 800},
		blackgrimoire = {short = "grimoire", order = {"grimoiregut", "grimoirescroll", "grimoirecover", "grimoirebinding"}, redeem = 250, tradein = 1333},
		["suremekh'neina"] = {short = "mantle", order = {"mantleenchant", "mantleclasp", "mantlelining", "mantlefabric"}, redeem = 250, tradein = 1333},
	},
	races = {
		lodestone = {short = "lodestone", order = {"lodestonetop", "lodestonebase", "lodestoneright", "lodestoneleft"}, redeem = 12, tradein = 66},		-- 100
		arachnideye = {short = "arachnid", order = {"arachnidlens", "arachnideyeball", "arachnidenchantment", "arachnidcolour"}, redeem = 12, tradein = 66},		-- 100
		panpipes = {short = "panpipes", order = {"panpipepipes", "panpipefeathers", "panpipehair", "panpipeflutes"}, redeem = 35, tradein = 186},		-- 280
		chitin = {short = "chitin", order = {"chitincolour", "chitinname", "chitincarving", "chitinfragment"}, redeem = 37, tradein = 200},				-- 300
		rattle = {short = "rattle", order = {"rattlebones", "rattleantlers", "rattlerunes", "rattlestaff"}, redeem = 37, tradein = 200},				-- 300
		whispercloth = {short = "cloth", order = {"clothenchantment", "clothbinding", "clothblood", "whispersilk"}, redeem = 50, tradein = 266},		-- 400
		demolitionsphere = {short = "sphere", order = {"sphereglass", "spherefire", "spherespark", "sphererunes"}, redeem = 62, tradein = 333},	-- 500
		sirensong = {short = "sirensong", order = {"sirenglass", "sirenvoice", "sirencork", "sirensmoke"}, redeem = 62, tradein = 333},		-- 500
		catapult = {short = "catapult", order = {"catapultframe", "catapultbolts", "catapultwheel", "catapultarm"}, redeem = 75, tradein = 400},		-- 600
		dalamyrrclaws = {short = "claws", order = {"clawstraps", "clawbase", "clawpoints", "clawbarbs"}, redeem = 87, tradein = 466},		-- 700
		frogskin = {short = "frogskin", order = {"froghead", "frogcord", "frogbody", "frogfeet"}, redeem = 100, tradein = 533},		-- 800
		mayafigurine = {short = "maya", order = {"figurinehead", "figurinearms", "figurinetorso", "figurinelegs"}, redeem = 187, tradein = 1000},		-- 1500
	},
	forays = {
		arankeshfeather = {short = "feather", order = {"arankeshfeatherspine", "arankeshfeatherdown", "arankeshfeathercolour", "arankeshfeatheredge"}},
		icossemirror = {short = "mirror", order = {"goldmirrorframe", "mirrorglass", "mirrorcurse", "mirrorinscription"}},
		ogrebroth = {short = "broth", order = {"brothbowl", "brothbroth", "brothseasoning", "brothspice"}},
		boulder = {short = "boulder", order = {"boulderchipping", "bouldershell", "bouldercore", "boulderstone"}},
		margamwheel = {short = "wheel", order = {"margamwheelweeds", "margamwheelbolts", "margamwheelwood", "margamwheelcentre"}},
		foraymap = {short = "map", order = {"mapfragmenttop", "mapfragmentbottom", "mapfragmentleft", "mapfragmentright"}},
	},
	cities = {
		musicbox = {short = "musicbox", order = {"musicboxsong", "musicboxmechanism", "musicboxframe", "musicboxcrank"}, redeem = 10, tradein = 333},
		biscuit = {short = "biscuit", order = {"biscuitbase", "biscuitspecial", "biscuitsugar", "biscuitsalt"}, redeem = 10, tradein = 50},
		wraithshackles = {short = "wraith", order = {"wraithshacklesmoke", "wraithshacklechain", "wraithshacklemanacles", "wraithshacklelock"}, redeem = 10, tradein = 533},
		tumbleweed = {short = "tumbleweed", order = {"tumbleweedroots", "tumbleweedtendrils", "tumbleweedvines", "tumbleweedstem"}, redeem = 10, tradein = 100},
		alabasterurn = {short = "urn", order = {"alabasterurnlid", "alabasterurnpot", "alabasterurninscription", "alabasterurnash"}, redeem = 10, tradein = 600},
		celescope = {short = "celescope", order = {"celescopeglobe", "celescopecylinders", "celescopeeyepiece", "celescopeingraving"}, redeem = 10, tradein = 333},
	},
	monks = {
		monkdummy = {short = "dummy", order = {"monkdummyhead", "monkdummyarms", "monkdummytorso", "monkdummylegs"}, redeem = 6, tradein = 33},		-- 50
		odysseantongue = {short = "tongue", order = {"tongueflesh", "tonguecasing", "tonguepolish", "tonguecurse"}, redeem = 18, tradein = 100},		-- 150
		monkheadband = {short = "headband", order = {"monkheadbandthreads", "monkheadbandamethyst", "monkheadbandenchantment", "monkheadbandsupport"}, redeem = 25, tradein = 133},		-- 200
		talonedring = {short = "talonring", order = {"crimsonsteelband", "quartzsetting", "ringsteelclaws", "talonedringbinding"}, redeem = 50, tradein = 266},		-- 400
		cranepennon = {short = "pennon", order = {"pennoncloth", "pennoncranes", "pennonstaff", "pennonthread"}, redeem = 87, tradein = 466},		-- 700 			???
		monkbanner = {short = "banner", order = {"monkbannerflag", "monkbannerembroidery", "monkbannerspear", "monkbannerthread"}, redeem = 200, tradein = 1066},		-- 1600
		ashstaff = {short = "staff", order = {"ashstaffstave", "ashstaffstrapping", "ashstaffcap", "ashstaffshoe"}, redeem = 218, tradein = 1166},		-- 1750
		olivebranch = {short = "branch", order = {"olivewood", "olivebranchshoots", "oliveleaves", "olivebranchenchantment"}, redeem = 137, tradein = 733},		-- 1100
	},
	elemental = {
		airelement = {short = "pet", order = {"airelementalcyclone", "airelementalessence", "airelementalbinding", "airelementallightning"}, redeem = 7, tradein = 40},		-- 60
		airbrooch = {short = "brooch", order = {"airbroochclasp", "airbroochgem", "airbroochsetting", "airbroochenchantment"}, redeem = 18, tradein = 100},		-- 150
		firependant = {short = "pendant", order = {"firependantchain", "firependantflame", "firependantsetting", "firependantjewel"}, redeem = 25, tradein = 133},		-- 200
		jawbone = {short = "jawbone", order = {"jawboneteeth", "jawbonemandibles", "jawbonebone", "jawbonehinge"}, redeem = 25, tradein = 133},		-- 200
		earthenshovel = {short = "shovel", order = {"earthshovelwood", "earthshovelblade", "earthshovelbinding", "earthshovelminerals"}, redeem = 46, tradein = 250},		-- 375
		garashshackle = {short = "shackle", order = {"garashshacklelinks", "garashshackleorbs", "garashshackleenchantment", "garashshacklechains"}, redeem = 75, tradein = 400},		-- 600
		seatears = {short = "tears", order = {"seatearsphial", "seatearsstopper", "seatearspaint", "seatearstears"}, redeem = 37, tradein = 200},		-- 300
		mudbomb = {short = "mudbomb", order = {"mudbombbinding", "mudbombmud"}, redeem = 87, tradein = 466},		-- 700
		searedglyph = {short = "glyph", order = {"searedglyphplaque", "searedglyphemblem", "searedglyphtendrils", "searedglyphflame"}, redeem = 106, tradein = 566},		-- 850
		firetank = {short = "tank", order = {"firetankframe", "firetankflame", "firetankinsignia", "firetanklinks"}, redeem = 168, tradein = 900},		-- 1350
		sceptre = {short = "sceptre", order = {"sceptrescript", "sceptreenchantment", "sceptreheart", "sceptretusk"}, redeem = 250, tradein = 1333},		-- 2000
		harness = {short = "harness", order = {"airharnessstraps", "airharnessglyphs", "airharnessenchantment", "airharnessbuckles"}, redeem = 212, tradein = 1133},		-- 1133
	},
	yggdrasil = {
		dreadpilar = {short = "dreadpilar", order = {"dreadpilarplates", "dreadpilarbody", "dreadpilarhead", "dreadpilarlegs"}},
		squargon = {short = "squargon", order = {"squargonbody", "squargonhead", "squargonlegs", "squargonfangs"}},
		yggdrasiltablet = {short = "tablet", order = {"tabletwax", "tabletwood", "tabletstylus", "tablettwine"}},
		valdblom = {short = "valdblom", order = {"valdblomstem", "valdblomleaves", "valdblomessence", "valdblomroot"}},
		earthshapingtome = {short = "shapingtome", order = {"shapingtomeclay", "shapingtomgranite", "shapingtomeplates", "shapingtominsignia"}},
		nexuscube = {short = "nexuscube", order = {"nexuscubegold", "nexuscubeglass", "nexuscubemote", "nexuscubescript"}},
		firecrystal = {short = "firecrystal", order = {"firecrystalenchantment", "firecrystalstone", "firecrystalflame", "firecrystalspark"}},
		planarmote = {short = "planarmote", order = {"moteflame", "moteaura", "motebinding", "moteenchantment"}},
		goldensnakeskin = {short = "snakeskin", order = {"goldenscales", "goldenskin", "goldencolouring", "goldenenchantment"}},
		yggdrasilbranch = {short = "branch", order = {"yggdrasilbranchwood", "yggdrasilbranchmosaic", "yggdrasilbranchline", "yggdrasilbranchhook"}},
		criersbell = {short = "bell", order = {"criersshell", "criershandle", "crierschime", "crierscurse"}},
	},	
	contenders = {
		contenderspig = {short = "pig", order = {"pigclay", "pigears", "pigbelly", "pigtail"}, redeem = 7, tradein = 40},		-- 60
		contendersjug = {short = "jug", order = {"juglip", "jugbase", "jugbowl", "jughandle"}, redeem = 12, tradein = 66},		-- 100
		contendersbouquet = {short = "bouquet", order = {"bouquetstring", "bouquetknot", "bouquetbloom", "bouquetstem"}, redeem = 18, tradein = 100},		-- 150
		contendersfigurine = {short = "figurine", order = {"contenderfigurinehead", "contenderfigurinearms", "contenderfigurinelegs", "contenderfigurinebody"}, redeem = 31, tradein = 166},		-- 250
		contendersglass = {short = "glass", order = {"glasshandle", "glasspane", "glassfocus", "glassframe"}, redeem = 37, tradein = 200},		-- 300
		contendersjournal = {short = "journal", order = {"journalbinding", "journalpage", "journalcover", "journalindex"}, redeem = 62, tradein = 333},		-- 500
		contendersstud = {short = "stud", order = {"studgleam", "studpost", "studgem", "studback"}, redeem = 125, tradein = 666},		-- 1000
		contendersribbon = {short = "ribbon", order = {"ribbongilding", "ribbonpin", "ribbonstripe", "ribbonfold"}, redeem = 175, tradein = 933},		-- 1400
	},
	underworld = {
		cryptworm = {short = "worm", order = {"cryptwormhead", "cryptwormbody", "cryptwormfangs", "cryptwormbinding"}, redeem = 10, tradein = 40}, -- no tradein
		psychesplinter = {short = "splinter", order = {"psychesplinterchain", "psychesplinterframe", "psychesplinterlength", "psychesplintercurse"}, redeem = 10, tradein = 120}, -- 180
		sanityskein = {short = "skein", order = {"sanityskeinthread", "sanityskeincoil", "sanityskeincurse", "sanityskeinbinding"}, redeem = 10, tradein = 146}, -- 220
		custodytalisman = {short = "custody", order = {"custodyleft", "custodyright", "custodycentre", "custodybinding"}, redeem = 10, tradein = 266}, -- 400
		unlifetotem = {short = "totem", order = {"unlifetotembase", "unlifetotemwood", "unlifetotemskull", "unlifetotemtendrils"}, redeem = 10, tradein = 333}, -- 500
		soulsliver = {short = "sliver", order = {"soulsliverobsidian", "soulsliverfog", "soulsliversouls", "soulslivercurse"}, redeem = 10, tradein = 533}, -- 800
		cullingblade = {short = "blade", order = {"cullingbladehilt", "cullingbladeedge", "cullingblademetal", "cullingbladecurse"}, redeem = 10, tradein = 1000}, -- 1500
		funeralshroud = {short = "shroud", order = {"funeralshroudcloth", "funeralshroudthread", "funeralshroudbenediction", "funeralshroudclasp"}, redeem = 10, tradein = 1333}, -- 2000
	},
	renegades = {
		mercenarychalk = {short = "chalk", order = {"mercenarychalkbinding", "mercenarychalkchalk", "mercenarychalkdust", "mercenarychalkstick"}, redeem = 8 , tradein = 42}, -- 65 
		elementalinjunction = {short = "injunction", order = {"injunctionscript", "injunctionpaper", "injunctionseal", "injunctionsignature"}, redeem = 7 , tradein = 36}, -- 60
		moppet = {short = "moppet", order = {"moppetcloth", "moppeteyes", "moppetthread", "moppetbuttons"}, redeem = 25 , tradein = 132}, -- 200
		turncoatscoat = {short = "coat", order = {"turncoatscoatcloth", "turncoatscoatbinding", "turncoatscoatthread", "turncoatscoatbuttons"}, redeem = 43, tradein = 231}, -- 350
		shadowcloak = {short = "shadowcloak", order = {"shadowcloakcloth", "shadowcloakclasp", "shadowcloakthread", "shadowcloakcurse"}, redeem = 75, tradein = 396}, -- 600
		betrayersmantle = {short = "betrayers", order = {"betrayersmantlecloth", "betrayersmantlethread", "betrayersmantlestraps", "betrayersmantlecurse"}, redeem = 100, tradein = 528}, -- 800
		turncoatsmasque = {short = "masque", order = {"turncoatsmasquestone", "turncoatsmasqueetchings", "turncoatsmasquecurse", "turncoatsmasqueeyes"}, redeem = 125, tradein = 660}, -- 1000
		sunderedpennon = {short = "sundered", order = {"sunderedpennoncloth", "sunderedpennonthread", "sunderedpennonstaff", "sunderedpennonbinding"}, redeem = 200, tradein = 1056}, -- 1600
	},
	invasion = {
		darkearthfigrine = {short = "darkearth", order = {"darkearthhead", "darkearthtorso", "darkeartharms", "darkearthlegs"}, redeem = 6, tradein = 33}, --50
		batteringram = {short = "batteringram", order = {"batteringramwheels", "batteringramram", "batteringramgrips", "batteringrambolts"}, redeem = 25, tradein = 132}, --200
		caltrop = {short = "caltrop", order = {"caltropspikes", "caltropball", "caltropbinding", "caltropbarbs"}, redeem = 43, tradein = 233}, -- 350
		cauldron = {short = "cauldron", order = {"cauldronpot", "cauldronoil", "cauldronhandle", "cauldronbase"}, redeem = 50, tradein = 264}, --400
		shadowshackle = {short = "shadowshackle", order = {"shadowshacklelink", "shadowshacklemetal", "shadowshackleenchantment", "shadowshackleshadow"}, redeem = 75, tradein = 400}, -- 600
		hagseye = {short = "hagseye", order = {"hagseyelid", "hagseyeball", "hagseyefluid", "hagseyeenchantment"}, redeem = 87, tradein = 466}, -- 700
		icebrick = {short = "icebrick", order = {"magicice", "repeatingspell", "icebinding", "iceenchantment"}, redeem = 112, tradein = 600}, -- 900
		scoutingmap = {short = "scoutingmap", order = {"scoutingmapenchantment", "scoutingmapicons", "scoutingmapink", "scoutingmapvellum"}, redeem = 150, tradein = 800}, -- 1200
	},
	war = {
		rottingremains = {short = "remains", order = {"remainsbones", "remainsmuscles", "remainsblood", "remainsflesh"}, redeem = 10, tradein = 80},
		gildedbit = {short = "bit", order = {"bitpatterns", "bitgilding", "bitchain", "bitbar"}, redeem = 10, tradein = 80},
		pigeon = {short = "pigeon", order = {"pigeonhead", "pigeonbody", "pigeonlegs", "pigeonwings"}, redeem = 10, tradein = 80},
		warcloud = {short = "warcloud", order = {"warcloudfog", "warcloudstench", "warcloudcurse", "warcloudbinding"}, redeem = 10, tradein = 80},
		portalhoop = {short = "portalhoop", order = {"portalhoopsteel", "portalhooplight", "portalhoopenchantment", "portalhoopbinding"}, redeem = 10, tradein = 80},
		observantsigil = {short = "sigil", order = {"observantsigilmetal", "observantsigilstar", "observantsigileye", "observantsigillatice"}, redeem = 10, tradein = 80},
	},
  planes = {
    cowculator = {short = "cow", order = {"cowculatorwood", "cowculatornumbers", "cowculatorpaint", "cowculatorspectacles"}, redeem = 12, tradein = 66},
    golemgateway = {short = "golem", order = {"gatewayemblem", "gatewaygates", "gatewayframe", "gatewaybars"}, redeem = 31, tradein = 166},
    hollowbook = {short = "book", order = {"hollowbookcovers", "hollowbookeye", "hollowbookglyphs", "hollowbookscream"}, redeem = 37, tradein = 200},
    brainjar = {short = "brainjar", order = {"brainjarpot", "brainjarbrains", "brainjarpreserves", "brainjarlabel"}, redeem = 50, tradein = 266},
    faemirror = {short = "mirror", order = {"faemirrorglass", "faemirrorcrystal", "faemirrorhandle", "faemirrorscript"}, redeem = 56, tradein = 300},
    celestialcoronet = {short = "coronet", order = {"coronetband", "coronetangels", "coronetspheres", "coronetengravings"}, redeem = 87, tradein = 466},
    chaosclaw = {short = "claw", order = {"chaosclawedge", "chaosclawtip", "chaosclawcorruption", "chaosclawspan"}, redeem = 100, tradein = 533},
    iconstatuette = {short = "icon", order = {"statuetteglobe", "statuettesigils", "statuetteshards", "statuetteicon"}, redeem = 125, tradein = 666},
    kris = {short = "kris", order = {"krisblade", "krishaft", "krisrunes", "krissteel"}, redeem = 1, tradein = 1},
    crystalsword = {short = "sword", order = {"crystalswordhilt", "crystalswordguard", "crystalswordblade", "crystalswordgem"}, redeem = 250, tradein = 1333},
  },

}


-- Require this to map the line when you find a talisman back to the short name
talisman.names = {

-- Elder Gods
  ["the stem for a cherry blossom"] = "cherryblossomstem",
  ["the flower for a cherry blossom"] = "cherryblossomflower",
  ["the stamen for a cherry blossom"] = "cherryblossomstamen",
  ["the scent for a cherry blossom"] = "cherryblossomscent",
  
  ["the crystal for a translucent filter"] = "filtercrystal",
  ["the bronze for a translucent filter"] = "filterbronze",
  ["the fitting for a translucent filter"] = "filterfitting",
  ["the polish for a translucent filter"] = "filterpolish", 
  
  ["the cloth for a sachet"] = "sachetcloth",
  ["the herbs for a sachet"] = "sachetherbs",
  ["the string for a sachet"] = "sachetstring",
  ["the scent for a sachet"] = "sachetscent", 
  
  ["the eyes for an obsidian hound carving"] = "houndcarvingeyes",
  ["the legs for an obsidian hound carving"] = "houndcarvinglegs",
  ["the fangs for an obsidian hound carving"] = "houndcarvingfangs",
  ["the obsidian for a hound carving"] = "houndcarvingobsidian",
  
  ["the head for a finishing hammer"] = "finishinghammerhead",
  ["the runes for a finishing hammer"] = "finishinghammerrunes",
  ["the handle for a finishing hammer"] = "finishinghammerhandle",
  ["the grip for a finishing hammer"] = "finishinghammergrip", 
  
  ["the strings for a citole"] = "citolestrings",
  ["the body for a citole"] = "citolebody",
  ["the base for a citole"] = "citolebase",
  ["the tune for a citole"] = "citoletune",
  
  ["the handle for a battered pan"] = "batteredpanhandle",
  ["the dish for a battered pan"] = "batteredpandish",
  ["the grip for a battered pan"] = "batteredpangrip",
  ["the spell for a battered pan"] = "batteredpanspell",
  
  ["the paper for a declaration of hostility"] = "declarationpaper",
  ["the text for a declaration of hostility"] = "declarationtext",
  ["the signature for a declaration of hostility"] = "declarationsignature",
  ["the seal for a declaration of hostility"] = "declarationseal",
  
  ["the feathers for a set of stormforged wings"] = "vastarwingfeathers",
  ["the straps for a set of stormforged wings"] = "vastarwingstraps",
  ["the span for a set of stormforged wings"] = "vastarwingspan",
  ["the lightning for a set of stormforged wings"] = "vastarwinglightning",

--Planes

  ["the wood for a cowculator carving"] = "cowculatorwood",
  ["the numbers for a cowculator carving"] = "cowculatornumbers",
  ["the paint for a cowculator carving"] = "cowculatorpaint",
  ["the spectacles for a cowculator carving"] = "cowculatorspectacles",

  ["the emblem for an iron gateway"] = "gatewayemblem",
  ["a set of iron gates"] = "gatewaygates",
  ["the frame for an iron gateway"] = "gatewayframe",
  ["the bars for an iron gateway"] = "gatewaybars",
    
  ["the pot for a jar of withered brains"] = "brainjarpot",
  ["the contents of a jar of withered brains"] = "brainjarbrains",
  ["the preserves for a jar of withered brains"] = "brainjarpreserves",
  ["the label for a jar of withered brains"] = "brainjarlabel",

  ["the covers for an empty book"] = "hollowbookcovers",
  ["the eye for an empty book"] = "hollowbookeye",
  ["the glyphs for an empty book"] = "hollowbookglyphs",
  ["the scream for an empty book"] = "hollowbookscream",

  ["the glass for a mirror of fae perception"] = "faemirrorglass",
  ["the crystal for a mirror of fae perception"] = "faemirrorcrystal",
  ["the handle for a mirror of fae perception"] = "faemirrorhandle",
  ["the script for a mirror of fae perception"] = "faemirrorscript",

  ["the band for a celestial coronet"] = "coronetband",
  ["the angels for a celestial coronet"] = "coronetangels",
  ["the spheres for a celestial coronet"] = "coronetspheres",
  ["the engravings for a celestial coronet"] = "coronetengravings",

  ["the edge for a jagged claw"] = "chaosclawedge",
  ["the tip for a jagged claw"] = "chaosclawtip",
  ["the corruption for a jagged claw"] = "chaosclawcorruption",
  ["the span for a jagged claw"] = "chaosclawspan",

  ["the globe for an icon statuette"] = "statuetteglobe",
  ["the sigils for an icon statuette"] = "statuettesigils",
  ["the shards for an icon statuette"] = "statuetteshards",
  ["the icon for a statuette"] = "statuetteicon",

  ["the blade for a sacrificial kris"] = "krisblade",
  ["the haft for a sacrificial kris"] = "krishaft",
  ["the runes for a sacrificial kris"] = "krisrunes",
  ["the steel for a sacrificial kris"] = "krissteel",

  ["the hilt for a crystal sword"] = "crystalswordhilt",
  ["the guard for a crystal sword"] = "crystalswordguard",
  ["the blade for a crystal sword"] = "crystalswordblade",
  ["the gem for a crystal sword"] = "crystalswordgem",
  
--Dragon

	["a Blue Dragon's claw"] = "bluedragonclaw",
	["Blue Dragon leather"] = "bluedragonleather",
	["a Blue Dragon's eye"] = "bluedragoneye",
	["a Blue Dragon's tooth"] = "bluedragontooth",
	["a Blue Dragon's heart"] = "bluedragonheart",
	["a Blue Dragon bone"] = "bluedragonbone",
	["a Blue Dragon's scale"] = "bluedragonscale",
	["a Blue Dragon's lung"] = "bluedragonlung",

	["a Red Dragon's claw"] = "reddragonclaw",
	["Red Dragon leather"] = "reddragonleather",
	["a Red Dragon's eye"] = "reddragoneye",
	["a Red Dragon's tooth"] = "reddragontooth",
	["a Red Dragon's heart"] = "reddragonheart",
	["a Red Dragon bone"] = "reddragonbone",
	["a Red Dragon's scale"] = "reddragonscale",
	["a Red Dragon's belly"] = "reddragonbelly",

	["a Black Dragon's claw"] = "blackdragonclaw",
	["Black Dragon leather"] = "blackdragonleather",
	["a Black Dragon's eye"] = "blackdragoneye",
	["a Black Dragon's tooth"] = "blackdragontooth",
	["a Black Dragon's heart"] = "blackdragonheart",
	["a Black Dragon bone"] = "blackdragonbone",
	["a Black Dragon's scale"] = "blackdragonscale",
	["a Black Dragon's acid sac"] = "blackdragonsac",

	["a Green Dragon's claw"] = "greendragonclaw",
	["Green Dragon leather"] = "greendragonleather",
	["a Green Dragon's eye"] = "greendragoneye",
	["a Green Dragon's tooth"] = "greendragontooth",
	["a Green Dragon's heart"] = "greendragonheart",
	["a Green Dragon bone"] = "greendragonbone",
	["a Green Dragon's scale"] = "greendragonscale",
	["a Green Dragon's poison sac"] = "greendragonsac",

	["a Gold Dragon's claw"] = "golddragonclaw",
	["Gold Dragon leather"] = "golddragonleather",
	["a Gold Dragon's eye"] = "golddragoneye",
	["a Gold Dragon's tooth"] = "golddragontooth",
	["a Gold Dragon's heart"] = "golddragonheart",
	["a Gold Dragon bone"] = "golddragonbone",
	["a Gold Dragon's scale"] = "golddragonscale",
	["a Gold Dragon's brain stem"] = "golddragonstem",

	["a Silver Dragon's claw"] = "silverdragonclaw",
	["Silver Dragon leather"] = "silverdragonleather",
	["a Silver Dragon's eye"] = "silverdragoneye",
	["a Silver Dragon's tooth"] = "silverdragontooth",
	["a Silver Dragon's heart"] = "silverdragonheart",
	["a Silver Dragon bone"] = "silverdragonbone",
	["a Silver Dragon's scale"] = "silverdragonscale",
	["a Silver Dragon's larynx"] = "silverdragonlarynx",
	
 --AZATLAN
  
	["a red eagle's feather"] = "redfeather",
	["a yellow eagle's feather"] = "yellowfeather",
	["a blue eagle's feather"] = "bluefeather",
	["a green eagle's feather"] = "greenfeather",
	["an orange eagle's feather"] = "orangefeather",
	["a purple eagle's feather"] = "purplefeather",
	["a black eagle's feather"] = "blackfeather",

	["a coati's tooth"] = "coatitooth",
	["a coati's collar"] = "coaticollar",
	["some coati bait"] = "coatibait",
	["a coati tail"] = "coatitail",
	["a coati's claw"] = "coaticlaw",
	["a coati's paw"] = "coatipaw",

	["a kinkajou's tooth"] = "kinkajoutooth",
	["a collar for a kinkajou"] = "kinkajoucollar",
	["some kinkajou bait"] = "kinkajoubait",
	["a kinkajou's tail"] = "kinkajoutail",
	["a kinkajou claw"] = "kinkajouclaw",
	["a kinkajou's paw"] = "kinkajoupaw",
	
	["a red quetzal feather"] = "quetzalredfeather",
	["a blue quetzal feather"] = "quetzalbluefeather",
	["a green quetzal feather"] = "quetzalgreenfeather",
	["a wooden quetzal cage"] = "quetzalcage",
	["a quetzal talon"] = "quetzaltalon",
	["a quetzal egg"] = "quetzalegg",

	["the left half of a Transoceanic Orb"] = "orbleft",
	["the right half of a Transoceanic Orb"] = "orbright",
	["the center of a Transoceanic Orb"] = "orbcenter",

	["the shaft of an atlatl"] = "atlatlshaft",
	["the cup of an atlatl"] = "atlatlcup",
	["a spear for an atlatl"] = "atlatlspear",

	["the broken tip of an obsidian knife"] = "knifebladetop",
	["the broken tang of an obsidian knife"] = "knifebladebottom",
	["some green leather"] = "knifeleather",
	
--Wonders

	["a bucket handle"] = "buckethandle",
	["a bucket's left side"] = "bucketleft",
	["a bucket's right side"] = "bucketright",
	["a bucket's base"] = "bucketbase",
	["a globe of enchanted water"] = "bucketwater",

	["blue Dragon scales"] = "packscales",
	["some backpack straps"] = "packstraps",
	["a backpack lining"] = "packlining",
	["backpack thread"] = "packthread",
	["backpack leather"] = "packleather",

	["a whistle mouthpiece"] = "whistlemouth",
	["a whistle's flue"] = "whistleflue",
	["a whistle reed"] = "whistlereed",
	["a whistle's top pipe"] = "whistletoppipe",
	["a whistle's bottom pipe"] = "whistlelowpipe",

	["a ram's horn"] = "ramshorn",
	["a horn mouthpiece"] = "hornmouth",
	["a left horn strap"] = "hornleftstrap",
	["a right horn strap"] = "hornrightstrap",
	["some fasteners"] = "hornfastener",

	["a lens top"] = "monotop",
	["a lens bottom"] = "monobottom",
	["a monocle frame"] = "monoframe",
	["a monocle's catch"] = "monocatch",
	["a monocle's clasp"] = "monoclasp",

	["a globe's top"] = "globetop",
	["a globe's middle"] = "globemiddle",
	["a globe's bottom"] = "globebottom",

--Misc
	
	["a hookah's base"] = "hookahbase",
	["a hookah's bowl"] = "hookahbowl",
	["a hookah's wind hood"] = "hookahhood",
	["a hookah's chain"] = "hookahchain",
	["a hookah's hoses"] = "hookahhoses",
	["a hookah's stem"] = "hookahstem",
	["a hookah's ash plate"] = "hookahplate",
	
	["the rollers for a tapestry"] = "tapestryroller",
	["an onyx pedestal"] = "tapestryonyx",
	["a piece of aged vellum"] = "tapestryvellum",	
	["the claw from a shadow dragon"] = "tapestryclaw",
	
	["the key to a vault"] = "keyfragment",
		
	["the fragment to a sphere"] = "spherefragment",
	
	["the body of a clay figurine"] = "clayfigurinebody",
	["the head of a clay figurine"] = "clayfigurinehead",
	["the legs of a clay figurine"] = "clayfigurinelegs",
	["the arms of a clay figurine"] = "clayfigurinearms",
	
--Historical

	["a Golden Window's frame"] = "windowframe",
	["a Golden Window's pane"] = "windowpane",
	["a Golden Window's jamb"] = "windowjamb",
	["a Golden Window's shutters"] = "windowshutters",
	["a Golden Window's grid"] = "windowgrid",
	
	["Mantle of Himalia cloth"] = "mantlecloth",
	["Mantle of Himalia thread"] = "mantlethread",
	["Mantle of Himalia centrepiece"] = "mantlecentre",
	["Mantle of Himalia gems"] = "mantlegems",
	
	
	[" an icicle's top"] = "icicletop",
	[" an icicle's middle"] = "iciclemiddle",
	[" an icicle's base"] = "iciclebase",
	[" an icicle's tip"] = "icicletip",
	["icicle runes"] = "iciclerunes",
	
	["an Ormyrr skull"] = "helmetskull",
	["a helmet nosepiece"] = "helmetnose",
	["a helmet strap"] = "helmetstrap",
	
	["a smooth piece of obsidian"] = "disctop",
	["a broken piece of obsidian"] = "discside",
	["a rough piece of obsidian"] = "discmiddle",
	["a smooth piece of obsidian"] = "discbottom",
	["obsidian runes"] = "discrunes",
	["a round piece of obsidian"] = "disccentre",
	
	["a votive's base"] = "votivebase",
	["a votive's wick"] = "votivewick",
	["votive wax"] = "votivewax",
	
	["a whisperstone top"] = "stonetop",
	["a whisperstone bottom"] = "stonebottom",
	["a rough whisperstone piece"] = "stonemiddle",
	["a jagged whisperstone piece"] = "stoneside",
	["a whisperstone core"] = "stonecore",
	["a whisperstone emitter"] = "stoneemitter",
	
	["glass lily petals"] = "lilypetals",
	["a glass lily stem"] = "lilystem",
	["a glass lily stamen"] = "lilystamen",
	["a glass lily bulb"] = "lilybulb",
	["a glass lily pistil"] = "lilypistil",
	
	["ozhera bait"] = "ozherabait",
	["an ozhera collar"] = "ozheracollar",
	["an ozhera egg"] = "ozheraegg",
	["an ozhera claw"] = "ozheraclaw",
	["an ozhera beak"] = "ozherabeak",
	["an ozhera nest"] = "ozheranest",
	
	["a polka-dotted turtle shell"] = "turtleshell",
	["turtle bait"] = "turtlebait",
	["a little turtle collar"] = "turtlecollar",
	["a polka-dot turtle tail"] = "turtletail",
	["a turtle foot"] = "turtlefoot",
	["a polka-dot turtle tongue"] = "turtletongue",
	
	["mongoose bait"] = "mongoosebait",
	["a mongoose collar"] = "mongoosecollar",
	["a mongoose claw"] = "mongooseclaw",
	["a mongoose paw"] = "mongoosepaw",
	["a mongoose tail"] = "mongoosetail",
	["a mongoose fang"] = "mongoosefang",
	
	["hellcat bait"] = "hellcatbait",
	["a hellcat collar"] = "hellcatcollar",
	["a hellcat claw"] = "hellcatclaw",
	["a hellcat fang"] = "hellcatfang",
	["a hellcat tail"] = "hellcattail",
	["a hellcat paw"] = "hellcatpaw",
	
--Conclave

	["a tophat's lining"] = "tophatlining",
	["a tophat's brim"] = "tophatbrim",
	["some thread"] = "tophatthread",
	["a tophat's hatband"] = "tophatband",

	["an hourglass's top"] = "hourglasstop",
	["an hourglass's bottom"] = "hourglassbottom",
	["hourglass sand"] = "hourglasssand",
	["an hourglass bulb"] = "hourglassbulb",

	["a beautiful gem"] = "broochgem",
	["a brooch's clasp"] = "broochclasp",
	["metal for a brooch"] = "broochmetal",
	["a brooch's hook"] = "broochhook",

	["an elemental sprite's legs"] = "spritelegs",
	["an elemental sprite's arms"] = "spritearms",
	["an elemental sprite's head"] = "spritehead",
	["an elemental sprite's torso"] = "spritetorso",

	["a vault's door"] = "vaultdoor",
	["a vault's hinge"] = "vaulthinge",
	["a vault's handle"] = "vaulthandle",
	["a vault's inlaid gems"] = "vaultgems",

	["a Ring of Flying's top"] = "ringtop",
	["a Ring of Flying's bottom"] = "ringbottom",
	["a Ring of Flying's inside"] = "ringinside",
	["a Ring of Flying's outside"] = "ringoutside",

	["the inside of an Armband of Celerity"] = "armbandinside",
	["the outside of an Armband of Celerity"] = "armbandoutside",
	["the top of an Armband of Celerity"] = "armbandtop",
	["the bottom of an Armband of Celerity"] = "armbandbottom",

	["a Buckawn Amulet's thread"] = "amuletthread",
	["A Buckawn Amulet's chain"] = "amuletchain",
	["a Buckawn Amulet's silver ball"] = "amuletball",
	["a Buckawn Amulet's thread"] = "amuletthread",

	["leather for a Grimoire of Adaptation"] = "grimoireleather",
	["paper for a Grimoire of Adaptation"] = "grimoirepaper",
	["gems for a Grimoire of Adaptation"] = "grimoiregems",
	["the lock for a Grimoire of Adaptation"] = "grimoirelock",

	["a Stygian Pendant's clasp"] = "pendantclasp",
	["a Stygian Pendant's pearl"] = "pendantpearl",
	["a Stygian Pendant's base"] = "pendantbase",
	["a Stygian Pendant's hook"] = "pendanthook",

	["thread for Grand Magi robes"] = "robesthread",
	["fabric for Grand Magi robes"] = "robesfabric",
	["trim for Grand Magi robes"] = "robestrim",
	["a needle for sewing Grand Magi robes"] = "robesneedle",

	["thread for Atavian wings"] = "wingsthread",
	["Atavian feathers"] = "wingsfeathers",
	["a left Atavian wing "] = "wingsleft",
	["a right Atavian wing"] = "wingsright",

--MARKS
  
	["a mouthpiece of a Warhorn of Heroes"] = "ivoryhornmouthpiece",
	["the fittings of a Warhorn of Heroes"] = "ivoryhornfittings",
	["the left side of a Warhorn of Heroes"] = "ivoryhornleft",
	["the right side of a Warhorn of Heroes"] = "ivoryhornright",

	["the disc of a Champion's medallion"] = "ivorymedalliondisc", 
	["the clasp of a Champion's medallion"] = "ivorymedallionclasp", 
	["the accent of a Champion's medallion"] = "ivorymedallionaccent", 
	["the ribbon of a Champion's medallion"] = "ivorymedallionribbon",
	
	["the lens of a Sangrean spyglass"] = "ivoryspyglasslens", 
	["the eye piece of a Sangrean spyglass"] = "ivoryspyglasseyepiece", 
	["the body of a Sangrean spyglass"] = "ivoryspyglassbody", 
	["the trap of a Sangrean spyglass"] = "ivoryspyglassstrap",

	["a piece of silk from an Ivory pennon"] = "ivorypennonsilk", 
	["a piece of ribbon from an Ivory pennon"] = "ivorypennonribbon", 
	["some thread from an Ivory pennon"] = "ivorypennonthread", 
	["some dye for an Ivory pennon"] = "ivorypennondye",

	[" the accent of an ivory armband"] = "ivoryarmbandaccent", 
	["the inner shell of a silver armband"] = "ivoryarmbandouter", 
	["the outer shell of a silver armband"] = "ivoryarmbandinner", 
	["a silver armband clasp"] = "ivoryarmbandclasp",
	
	["the body of an Atlantia dummy"] = "ivoryatlantiabody", 
	["the legs of an Atlantia dummy"] = "ivoryatlantialegs", 
	["the head of an Atlantia dummy"] = "ivoryatlantiahead", 
	["the arms of an Atlantia dummy"] = "ivoryatlantiaarms",

	["the limbs of a Champion's Training dummy"] = "ivorydummylimbs", 
	["the torso of a Champion's Training dummy"] = "ivorydummytorso", 
	["the clothing of a Champion's Training dummy"] = "ivorydummyclothing", 
	["the armour of a Champion's Training dummy"] = "ivorydummyarmour",
	
	["the base of a miniature ivory tower"] = "ivorytowerbase", 
	["the lower steps of a miniature ivory tower"] = "ivorytowerlower", 
	["the upper part of a miniature ivory tower"] = "ivorytowerupper", 
	["the laquer for a miniature ivory tower"] = "ivorytowerlacquer",

	["the core of an Atlantia bowstring"] = "ivorybowstringcore", 
	["the wrapping of an Atlantia bowstring"] = "ivorybowstringwrapping", 
	["the eyelet of an Atlantia bowstring"] = "ivorybowstringeyelet", 
	["the enchantment for an Atlantia bowstring"] = "ivorybowstringenchant",

	["the hilt of an Anima's Thirst"] = "quisaisdaggerhilt", 
	["the blade of an Anima's Thirst"] = "quisalisdaggerblade", 
	["the pommel of an Anima's Thirst"] = "quisalisdaggerpommel", 
	["the grip of an Anima's Thirst"] = "quisalisdaggergrip",

	["the lower fragment of a notched bone"] = "quisalisbonelower", 
	["the upper fragment of a notched bone"] = "quisalisboneupper", 
	["a piece of rope for a notched bone"] = "quisalisbonerope", 
	["the stain of a notched bone"] = "quisalisbonestain",

	["the chain of a Callibian medallion"] = "quisalismedallionchain", 
	["the top part of a Callibian medallion"] = "quisalismedalliontop", 
	["the bottom fragment of a Callibian medallion"] = "quisalismedallionbottom", 
	["the clasp of a Callibian medallion"] = "quisalismedallionclasp",

	["the case of the Grandmaster's looking glass"] = "quisalisglasscase", 
	["the lens of the Grandmaster's looking glass"] = "quisalisglasslens", 
	["the iris of the Grandmaster's looking glass"] = "quisalisglassiris", 
	["the eye piece of the Grandmaster's looking glass"] = "quisalisglasseyepiece",

	["the hair of a Derillin dummy"] = "quisalisderillinhair", 
	["the clothing of a Derillin dummy"] = "quisalisderillinclothing", 
	["the head of a Derillin dummy"] = "quisalisderillinhead", 
	["the torso of a Derillin dummy"] = "quisalisderillintorso",

	["the limbs of an Assassin's dummy"] = "quisalisdummylimbs", 
	["the torso of an Assassin's dummy"] = "quisalisdummytorso", 
	["the robes of an Assassin's dummy"] = "quisalisdummyrobes", 
	["the targets of an Assassin's dummy"] = "quisalisdummytargets",
	
	["the top of a Quisalis tombstone"] = "quisalistombstonetop", 
	["the middle of a Quisalis tombstone"] = "quisalistombstonemiddle", 
	["the base of a Quisalis tombstone"] = "quisalistombstonebase", 
	["the script of a Quisalis tombstone"] = "quisalistombstonescript",

	["the serpent insignia of a steel armband"] = "quisalisarmbandserpent", 
	["the eyes of a steel armband"] = "quisalisarmbandeyes", 
	["the top fragment of a steel armband"] = "quisalisarmbandtop", 
	["the bottom fragment of a steel armband"] = "quisalisarmbandbottom",

	["the cloth of a cloak of the Blood Maiden"] = "quisaliscloakcloth", 
	["the embroidery of a cloak of the Blood Maiden"] = "quisaliscloakembroidery", 
	["the lining of a cloak of the Blood Maiden"] = "quisaliscloaklining", 
	["the hood of a cloak of the Blood Maiden"] = "quisaliscloakhood",

	["the bone of a Death Keeper's mask"] = "quisalismaskbone", 
	["the wire of a Death Keeper's mask"] = "quisalismaskwire", 
	["the teeth of a Death Keeper's mask"] = "quisalismaskteeth", 
	["the runes of a Death Keeper's mask"] = "quisalismaskrunes",

-- SEAFARING

	["the contents of a cargo crate of clovers"] = "cloverboxclovers",
	["the sides from a cargo crate of clovers"] = "cloverboxsides",
	["the lid from a cargo crate of clovers"] = "cloverboxlid",
	["the base of a cargo crate of clovers"] = "cloverboxbase",
 
	["the arms of a figurine of Captain Maelstrom"] = "maelstromarms",
	["the legs of a figurine of Captain Maelstrom"] = "maelstromlegs",
	["the torso of a figurine of Captain Maelstrom"] = "maelstromtorso",
	["the head of a figurine of Captain Maelstrom"] = "maelstromhead",
 
	["the left wing of a scintillating pair of cascading wings"] = "islandwingsleft",
	["the right wing of a scintillating pair of cascading wings"] = "islandwingsright",
	["the binding thread of a scintillating pair of cascading wings"] = "islandwingsthread",
	["the shoulder straps of a scintillating pair of cascading wings"] = "islandwingsstraps",
 
	["the handle of a frosted pail of pitch"] = "frostpailhandle",
	["the left-hand side of a frosted pail of pitch"] = "frostpailleft",
	["the right-hand side of a frosted pail of pitch"] = "frostpailright",
	["the base of a frosted pail of pitch"] = "frostpailbase",
 
	["the handle of a neatly-appointed pail of pitch"] = "neatpailhandle",
	["the left-hand side of a neatly-appointed pail of pitch"] = "neatpailleft",
	["the right-hand side of a neatly-appointed pail of pitch"] = "neatpailright",
	["the base of a neatly-appointed pail of pitch"] = "neatpailbase",
 
	["the top half of a Shipwright's union chit"] = "shipchittop",
	["the bottom half of a Shipwright's union chit"] = "shipchitbottom",
	["the ink from a Shipwright's union chit"] = "shipchitink",
	["the official seal from a Shipwright's union chit"] = "shipchitseal",
 
	["the mounting plate for an etched and lacquered plaque"] = "xpplaquemount",
	["the fascia from an etched and lacquered plaque"] = "xpplaquefascia",
	["the lacquer for an etched and lacquered plaque"] = "xpplaquelacquer",
	["the lettering from an etched and lacquered plaque"] = "xpplaquelettering",
 
	["the ink from a stylised ocean map"] = "monstermapink",
	["the parchment from a stylised ocean map"] = "monstermapparchment",
	["the compass rose from a stylised ocean map"] = "monstermapcompass",
	["the magical enchantment from a stylised ocean map"] = "monstermapenchant",
 
	["the mounting plate of a crossbow of coconut lumber"] = "crossbowmount",
	["the draw arms of a crossbow of coconut lumber"] = "crossbowarms",
	["the string from a crossbow of coconut lumber"] = "crossbowstring",
	["the winding crank of a crossbow of coconut lumber"] = "crossbowcrank",
 
	["the neck from a polished green bottle"] = "glassbottleneck",
	["the main cylinder from a polished green bottle"] = "glassbottlemiddle",
	["the base of a polished green bottle"] = "glassbottlebase",
	["the magical enchantment from a polished green bottle"] = "glassbottleenchant",
 
	["the handle of an overgrown pail of pitch"] = "seaweedpailhandle",
	["the left-hand side of an overgrown pail of pitch"] = "seaweedpailleft",
	["the right-hand side of an overgrown pail of pitch"] = "seaweedpailright",
	["the base of an overgrown pail of pitch"] = "seaweedpailbase",
	
	["the shell of a smoke flare"] = "smokeflareshell",
	["the fins of a smoke flare"] = "smokeflarefins",
	["the lid of a smoke flare"] = "smokeflarelid",
	["the chamber of a smoke flare"] = "smokeflarechamber",
 
--Death

	["the top of a loop of mortal coil"] = "coiltop",
	["the bottom of a loop of mortal coil"] = "coilbottom",
	["a strand of mortal coil"] = "coilstrand",
	["the binding for a loop of mortal coil"] = "coilbinding",

	["the tip of a vulture's talon"] = "talontip",
	["the stem of a vulture's talon"] = "talonstem",
	["the base of a vulture's talon"] = "talonbase",
	["the poison for a vulture's talon"] = "talonpoison",

	["some candle wax"] = "candlewax",
	["the flame for a candle of cessation"] = "candleflame",
	["the base for a candle of cessation"] = "candlebase",
	["the string for a candle of cessation"] = "candlestring",
	
	["the head of a cowled dummy"] = "deathdummyhead",
	["the arms of a cowled dummy"] = "deathdummyarms",
	["the torso of a cowled dummy"] = "deathdummytorso",
	["the legs of a cowled dummy"] = "deathdummylegs",
	
	["the top of a gravestone"] = "gravestonetop",
	["the bottom of a gravestone"] = "gravestonebottom",
	["the inscription for a gravestone"] = "gravestoneinscription",
	["the lichen for a gravestone"] = "gravestonelichen",
	
	["the base of a soulfire crucible"] = "cruciblebase",
	["the handle of a soulfire crucible"] = "cruciblehandle",
	["the bowl of a soulfire crucible"] = "cruciblebowl",
	["the flame of a soulfire crucible"] = "crucibleflame",
	
	["the mouthpiece for death's call"] = "deathscallmouth",
	["the horn for death's call"] = "deathscallhorn",
	["the tassels for death's call"] = "deathscalltassels",
	["the coil for death's call"] = "deathscallcoil",
	
	["the brocade for a sycophantic shoulder cape"] = "capebrocade",
	["the thread for a sycophantic shoulder cape"] = "capethread",
	["the enchantment for a sycophantic shoulder cape"] = "capeenchantment",
	["the velvet for a sycophantic shoulder cape"] = "capevelvet",
	
--Blackwave

	["The top of a taper of eternity"] = "tapertop", 
	["The bottom of a taper of eternity"] = "taperbottom",
	["The wax for a taper of eternity"] = "taperwax",
	["The string for a taper of eternity"] = "taperstring",

	["The band for a ring of finality"] = "signetband",
	["The bezel for a ring of finality"] = "signetbezel",
	["The carving for a ring of finality"] = "signetcarving",
	["The marks for a ring of finality"] = "signetmarks",

	["The lizard for a grievous keyring"] = "keyringlizard",
	["The tiger for a grievous keyring"] = "keyringtiger",
	["The slate for a grievous keyring"] = "keyringslate",
	["The hoop for a grievous keyring"] = "keyringhoop",

	["The head of a goblin"] = "goblinhead",
	["The arms of a goblin"] = "goblinarms",
	["The torso of a goblin"] = "goblintorso",
	["The legs of a goblin"] = "goblinlegs",

	["The top of a subjectioner's spigot"] = "spigottop",
	["The bottom of a subjectioner's spigot"] = "spigotbottom",
	["The stem of a subjectioner's spigot"] = "spigotstem",
	["The tip of a subjectioner's spigot"] = "spigottip",

	["The band for sunless hope"] = "sunlessband",
	["The stone for sunless hope"] = "sunlessstone",
	["The binding for sunless hope"] = "sunlessbinding",
	["The enchantment for sunless hope"] = "sunlessenchantment",

	["The fur for Vakha's bribe"] = "circletfur",
	["The blades for Vakha's bribe"] = "circletblades",
	["The band for Vakha's bribe"] = "circletband",
	["The binding for Vakha's bribe"] = "circletbinding",

	["The stone for pedigree's jewel"] = "sanguinestone",
	["The aura for pedigree's jewel"] = "sanguineaura",
	["The teardrop for pedigree's jewel"] = "sanguineteardrop",
	["The blood for pedigree's jewel"] = "taintedblood",

	["The lid for a canopic jar"] = "canopiclid",
	["The fluid for a canopic jar"] = "canopicfluid",
	["The base for a canopic jar"] = "canopicbase",
	["The pot for a canopic jar"] = "canopicpot",

	["A shard for an apperception stone"] = "crystalshard",
	["The base of an apperception stone"] = "crystalbase",
	["The binding for an apperception stone"] = "crystalbinding",
	["The portal for an apperception stone"] = "crystalportal",

	["The leather for revelation's guise"] = "guiseleather",
	["The thread for revelation's guise"] = "guisethread",
	["The smile for revelation's guise"] = "guisesmile",
	["The enchantment for revelation's guise"] = "guiseenchantment",

	["The scroll for an experimenter's grimoire"] = "grimoirescroll",
	["The gut for an experimenter's grimoire"] = "grimoiregut",
	["The cover for an experimenter's grimoire"] = "grimoirecover",
	["The binding for an experimenter's grimoire"] = "grimoirebinding",

	["The enchantment for suremekh'neina"] = "mantleenchant",
	["The clasp for suremekh'neina"] = "mantleclasp",
	["The fabric for suremekh'neina"] = "mantlefabric",
	["The lining for suremekh'neina"] = "mantlelining",

-- RACES SET

	["The pipes for a set of crystalline panpipes"] = "panpipepipes",
	["the feathers for a set of crystalline panpipes"] = "panpipefeathers",
	["The hair for a set of crystalline panpipes"] = "panpipehair",
	["The flutes for a set of crystalline panpipes"] = "panpipeflutes",

	["The bones for a shamanistic rattle"] = "rattlebones",
	["The staff for a shamanistic rattle"] = "rattlestaff",
	["The antlers for a shamanistic rattle"] = "rattleantlers",
	["The runes for a shamanistic rattle"] = "rattlerunes",

	["The frame for a collapsable catapult"] = "catapultframe",
	["The bolts for a collapsable catapult"] = "catapultbolts",
	["The wheel for a collapsable catapult"] = "catapultwheel",
	["The arm for a collapsable catapult"] = "catapultarm",

	["Some blood spattered cloth"] = "clothblood",
	["A piece of whispersilk"] = "whispersilk",
	["The enchantment for a whispercloth"] = "clothenchantment",
	["The binding for a whispercloth"] = "clothbinding",

	["The glass for a demolition sphere"] = "sphereglass",
	["The fire for a demolition sphere"] = "spherefire",
	["The runes for a demolition sphere"] = "sphererunes",
	["The spark for a demolition sphere"] = "spherespark",

	["The carving for a piece of horkval chitin"] = "chitincarving",
	["A fragment of horkval chitin"] = "chitinfragment",
	["The colouring for a piece of horkval chitin"] = "chitincolour",
	["The name for a piece of horkval chitin"] = "chitinname",

	["The head for a flattened frogskin"] = "froghead",
	["The cord for a flattened frogskin"] = "frogcord",
	["The body for a flattened frog skin"] = "frogbody",
	["The feet for a flattened frog skin"] = "frogfeet",

	["The barbs for a pair of Dala'myrr claws"] = "clawbarbs",
	["The points for a set of Dala'myrr claws"] = "clawpoints",
	["The straps for a set of Dala'myrr claws"] = "clawstraps",
	["The base for a pair of Dala'myrr claws"] = "clawbase",

	["The glass for a bottled siren's song"] = "sirenglass",
	["The voice for a bottled siren's song"] = "sirenvoice",
	["The cork for a bottled siren's song"] = "sirencork",
	["The smoke for a bottled siren's song"] = "sirensmoke",

	["The lens for an arachnid eye"] = "arachnidlens",
	["The eyeball for an arachnid eye"] = "arachnideyeball",
	["The enchantment for an arachnid's eye"] = "arachnidenchantment",
	["The colouration for an arachnid's eye"] = "arachnidcolour",

	["The top of a dwarven lodestone"] = "lodestonetop",
	["The left fragment of a dwarven lodestone"] = "lodestoneleft",
	["The base of a dwarven lodestone"] = "lodestonebase",
	["The right fragment of a dwarven lodestone"] = "lodestoneright",

	["The head of a figurine of the suffering Maya"] = "figurinehead",
	["The arms of a figurine of the suffering Maya"] = "figurinearms",
	["The torso of a figurine of the suffering Maya"] = "figurinetorso",
	["The legs of a figurine of the suffering Maya"] = "figurinelegs",

-- FORAYS
 
	["the spine of a feather from Aran'Kesh"] = "arankeshfeatherspine",
	["the down from a feather of Aran'Kesh"] = "arankeshfeatherdown",
	["the colouration for a feather from Aran'Kesh"] = "arankeshfeathercolour",
	["the lethally sharp edge of a feather from Aran'Kesh"] = "arankeshfeatheredge",
 
	["a golden mirror frame"] = "goldmirrorframe",
	["silvery mirror class"] = "mirrorglass",
	["a cursed piece of glass"] = "mirrorcurse",
	["the inscription for a cursed mirror"] = "mirrorinscription",
 
	["the bowl for some ogre's broth"] = "brothbowl",
	["some basic ogre's broth"] = "brothbroth",
	["some seasoning for ogre's broth"] = "brothseasoning",
	["some special ogre spices"] = "brothspice",
 
	["the chipping for a large boulder"] = "boulderchipping",
	["the shell for a large boulder"] = "bouldershell",
	["the core of a large boulder"] = "bouldercore",
	["the stone for a large boulder"] = "boulderstone",
 
	["clumps of weeds"] = "margamwheelweeds",
	["the bolts for a ship's wheel"] = "margamwheelbolts",
	["the wood for a ship's wheel"] = "margamwheelwood",
	["a cursed ship's wheel centre"] = "margamwheelcentre",
 
	["the top of a map fragment"] = "mapfragmenttop",
	["the bottom of a map fragment"] = "mapfragmentbottom",
	["the left piece of a map fragment"] = "mapfragmentleft",
	["the right piece of a map fragment"] = "mapfragmentright",

-- Cities set

	["The chain for a set of wraith shackles"] = "wraithshacklechain",
	["The smoke for a set of wraith shackles"] = "wraithshacklesmoke",
	["The manacles for a set of wraith shackles"] = "wraithshacklemanacle",
	["The lock for a set of wraith shackles"] = "wraithshacklelock",

	["The globe for a celescope"] = "celescopeglobe",
	["The cylinders for a celescope"] = "celescopecylinders",
	["The eyepiece for a celescope"] = "celescopeeyepiece",
	["The ingraving for a celescope"] = "celescopeingraving",

	["The base for a disgusting biscuit"] = "biscuitbase",
	["The special ingredient for a disgusting biscuit"] = "biscuitspecial",
	["The sugar for a disgusting biscuit"] = "biscuitsugar",
	["The salt for a disgusting biscuit"] = "biscuitsalt",

	["The song for a music box"] = "musicboxsong",
	["The mechanism for a music box"] = "musicboxmechanism",
	["The frame for a broken music box"] = "musicboxframe",
	["The crank for a broken music box"] = "musicboxcrank",

	["The lid for an alabaster urn"] = "alabasterurnlid",
	["The pot for an alabaster urn"] = "alabasterurnpot",
	["The inscription for an alabaster urn"] = "alabasterurninscript",
	["The ash for an alabaster urn"] = "alabasterurnash",

	["The roots for a tumbleweed"] = "tumbleweedroots",
	["The tendrils for a tumbleweed"] = "tumbleweedtendrils",
	["The vines for a tumbleweed"] = "tumbleweedvines",
	["The roots for a tumbleweed"] = "tumbleweedstem",

-- Monks
	
	["The head of a monk dummy"] = "monkdummyhead",
	["The arms of a monk dummy"] = "monkdummyarms",
	["The torso of a monk dummy"] = "monkdummytorso",
	["The legs of a monk dummy"] = "monkdummylegs",

	["The fleshy part of a tongue"] = "tongueflesh",
	["The metal casing for a tongue"] = "tonguecasing",
	["The polish for the metal casing for a tongue"] = "tonguepolish",
	["The curse for an odyssean tongue"] = "tonguecurse",

	["The threads for a black headband"] = "monkheadbandthreads",
	["The amethyst for a black headband"] = "monkheadbandamethyst",
	["The enchantment for a black headband"] = "monkheadbandenchantment",
	["The support for a black headband"] = "monkheadbandsupport",

	["A crimson steel band"] = "crimsonsteelband",
	["A rough-cut quartz setting"] = "quartzsetting",
	["The claws for a taloned ring"] = "ringsteelclaws",
	["The binding for a taloned ring"] = "talonedringbinding",

	["The cloth for a pennon of cranes"] = "pennoncloth",
	["The cranes for a pennon"] = "pennoncranes",
	["The staff for a pennon of cranes"] = "pennonstaff",
	["The thread for a pennon of cranes"] = "pennonthread",

	["The flag for a rallying banner"] = "monkbannerflag",
	["The embroidery for a rallying banner"] = "monkbannerembroidery",
	["The spear for a rallying banner"] = "monkbannerspear",
	["The thread for a rallying banner"] = "monkbannerthread",

	["The stave for an ash wood staff"] = "ashstaffstave",
	["The strapping for an ash wood staff"] = "ashstaffstrapping",
	["The cap for an ash wood staff"] = "ashstaffcap",
	["The shoe for an ash wood staff"] = "ashstaffshoe",

	["The wood for an olive branch"] = "olivewood",
	["The shoots for an olive branch"] = "olivebranchshoots",
	["The leaves for an olive branch"] = "oliveleaves",
	["The enchantment for an olive branch"] = "olivebranchenchantment",

-- Elemental

	["The cyclone for an Air Elemental"] = "airelementalcyclone",
	["The essence for an Air Elemental"] = "airelementalessence",
	["The binding for an Air Elemental"] = "airelementalbinding",
	["The lightning for an Air Elemental"] = "airelementallightning",

	["The clasp for a brooch of the tempest"] = "airbroochclasp",
	["The gem for a brooch of the tempest"] = "airbroochgem",
	["The setting for a brooch of the tempest"] = "airbroochsetting",
	["The enchantment for a brooch of the tempest"] = "airbroochenchantment",

	["The chain for a fire pendant"] = "firependantchain",
	["The flame for a fire pendant"] = "firependantflame",
	["The setting for a fire pendant"] = "firependantsetting",
	["The jewel for a fire pendant"] = "firependantjewel",

	["The teeth for a warblefish's jawbone"] = "jawboneteeth",
	["The mandibles for a warblefish's jawbone"] = "jawbonemandibles",
	["The bone for a warblefish's jawbone"] = "jawbonebone",
	["The hinge for a warblefish's jawbone"] = "jawbonehinge",

	["The wood for a mineral-crusted shovel"] = "earthshovelwood",
	["The blade for a mineral-crusted shovel"] = "earthshovelblade",
	["The binding for a mineral-crusted shovel"] = "earthshovelbinding",
	["The minerals for a mineral-crusted shovel"] = "earthshovelminerals",

	["The phial for some tears of the sea"] = "seatearsphial",
	["The stopper for a phial of some tears of the sea"] = "seatearsstopper",
	["The paint for a phial for some tears of the sea"] = "seatearspaint",
	["Some tears of the sea"] = "seatearstears",

	["The links for a shackle of Garash"] = "garashshacklelinks",
	["The orbs for a shackle of Garash"] = "garashshackleorbs",
	["The enchantment for a shackle of Garash"] = "garashshackleenchantment",
	["The chains for a shackle of Garash"] = "garashshacklechains",

	["Some sticky mud"] = "mudbombmud",
	["The binding for a sticky mud bomb"] = "mudbombbinding",

	["The plaque for a seared glyph"] = "searedglyphplaque",
	["The emblem for a seared glyph"] = "searedglyphemblem",
	["The tendrils for a seared glyph"] = "searedglyphtendrils",
	["The flame for a seared glyph"] = "searedglyphflame",

	["The frame for an armoured charge tank"] = "firetankframe",
	["The flame for an armoured charge tank"] = "firetankflame",
	["The insignia for an armoured charge tank"] = "firetankinsignia",
	["The links for an armoured charge tank"] = "firetanklinks",

	["The script for a sceptre of aqueous mastery"] = "sceptrescript",
	["The enchantment for a sceptre of aqueous mastery"] = "sceptreenchantment",
	["The heart of a sceptre of aqueous mastery"] = "sceptreheart",
	["The tusk for a sceptre of aqueous mastery"] = "sceptretusk",

	["The straps for a stratospheric harness"] = "airharnessstraps",
	["The glyphs for a stratospheric harness"] = "airharnessglyphs",
	["The enchantment for a stratospheric harness"] = "airharnessenchantment",
	["The buckles for a stratospheric harness"] = "airharnessbuckles",

-- Yggdrasil
	
	["The plates for a dreadpilar figurine"] = "dreadpilarplates",
	["The body for a dreadpilar figurine"] = "dreadpilarbody",
	["The legs for a dreadpilar figurine"] = "dreadpilarlegs",
	["The head for a dreadpilar figurine"] = "dreadpilarhead",
	
	["a Squargon's head"] = "squargonhead",
	["The legs of a Squargon"] = "squargonlegs",
	["The body of a Squargon"] = "squargonbody",
	["The fangs for a Squargon"] = "squargonfangs",
	
	["The wax for a tablet"] = "tabletwax",
	["The wood for a tablet"] = "tabletwood",
	["The stylus for a tablet"] = "tabletstylus",
	["The twine	for a tablet"] = "tablettwine",
	
	["a valdblom stem"] = "valdblomstem",
	["Some valdblom leaves"] = "valdblomleaves",
	["Some valdblom essence"] = "valdblomessence",
	["a valdblom root"] = "valdblomroot",
	
	["The clay for a tash'la shaping tome"] = "shapingtomeclay",
	["The granite for a tash'la shaping tome"] = "shapingtomgranite",
	["The plates for a tash'la shaping tome"] = "shapingtomeplates",
	["The insignia for a tash'la shaping tome"] = "shapingtominsignia",
	
	["The script for a nexus cube"] = "nexuscube",
	["The gold for a nexus cube"] = "nexuscubegold",
	["The glass for a nexus cube"] = "nexuscubeglass",
	["The mote for a nexus cube"] = "nexuscubemote",
	
	["The stone for a fire crystal"] = "firecrystalstone",
	["The flame for a fire crystal"] = "firecrystalflame",
	["The enchantment for a fire crystal"] = "firecrystalenchantment",
	["The spark for a fire crystal"] = "firecrystalspark",
	
	["The flame for a planar mote"] = "moteflame",
	["The aura for a planar mote"] = "moteaura",
	["The binding for a planar mote"] = "motebinding",
	["The enchantment for a planar mote"] = "moteenchantment",
	
	["The scales from some snakeskin"] = "goldenscales",
	["a length of snakeskin"] = "goldensnakeskin",
	["The colouring from some snakeskin"] = "goldencolouring",
	["The enchantment from some snakeskin"] = "goldenenchantment",
	
	["Some wood for a branch Yggdrasil"] = "yggdrasilbranchwood",
	["A mosiac for a branch of Yggdrasil"] = "yggdrasilbranchmosaic",
	["Some enchancted fishing line"] = "yggdrasilbranchline",
	["An iron hook"] = "yggdrasilbranchhook",
	
	["The shell for a crier's bell"] = "criersshell",
	["The handle for a crier's bell"] = "criershandle",
	["The chime for a crier's bell"] = "crierschime",
	["The curse for a crier's bell"] = "crierscurse",
	
-- CONTENDERS
	
	["The clay for a piglet bank"] = "pigclay",
	["The ears of a piglet bank"] = "pigears",
	["The belly of a piglet bank"] = "pigbelly",
	["The tail of a piglet bank"] = "pigtail",

	["The lip for a jug of chum"] = "juglip",
	["The base for a jug of chum"] = "jugbase",
	["The bowl for a jug of chum"] = "jugbowl",
	["The handle for a jug of chum"] = "jughandle",

	["The string for a bouquet"] = "bouquetstring",
	["The knot for a bouquet"] = "bouquetknot",
	["The bloom for a bouquet"] = "bouquetbloom",
	["The stem for a bouquet"] = "bouquetstem",

	["The head for a featureless figurine"] = "contenderfigurinehead",
	["The arms for a featureless figurine"] = "contenderfigurinearms",
	["The legs for a featureless figurine"] = "contenderfigurinelegs",
	["The body for a featureless figurine"] = "contenderfigurinebody",

	["The handle for a magnifying glass"] = "glasshandle",
	["The pane for a magnifying glass"] = "glasspane",
	["The focus for a magnifying glass"] = "glassfocus",
	["The frame for a magnifying glass"] = "glassframe",

	["The binding for an adventurer's journal"] = "journalbinding",
	["The page for an adventurer's journal"] = "journalpage",
	["The cover for an adventurer's journal"] = "journalcover",
	["The index for an adventurer's journal"] = "journalindex",

	["The gleam for a prismatic stud"] = "studgleam",
	["The post for a prismatic stud"] = "studpost",
	["The gem for a prismatic stud"] = "studgem",
	["The back for a prismatic stud"] = "studback",

	["The gilding for a crimson ribbon bar"] = "ribbongilding",
	["The pin for a crimson ribbon bar"] = "ribbonpin",
	["The stripe for a crimson ribbon bar"] = "ribbonstripe",
	["The fold for a crimson ribbon bar"] = "ribbonfold",

-- UNDERWORLD

	["The head of a crypt worm"] = "cryptwormhead", 
	["The body of a crypt worm"] = "cryptwormbody", 
	["The fangs of a crypt worm"] = "cryptwormfangs", 
	["The binding for a crypt worm"] = "cryptwormbinding",
	
	["The chain for a splinter of shattered psyche"] = "psychesplinterchain", 
	["The frame for a splinter of shattered psyche"] = "psychesplinterframe", 
	["The length for a splinter of shattered psyche"] = "psychesplinterlength", 
	["The curse for a splinter of shattered psyche"] = "psychesplintercurse",
	
	["The thread for a skein of sanity"] = "sanityskeinthread", 
	["The coil for a skein of sanity"] = "sanityskeincoil", 
	["The curse for a skein of sanity"] = "sanityskeincurse", 
	["The binding for a skein of sanity"] = "sanityskeinbinding",
	
	["The left half of a custody talisman"] = "custodyleft", 
	["The right half of a custody talisman"] = "custodyright", 
	["The centre of a custody talisman"] = "custodycentre", 
	["The binding for a custody talisman"] = "custodybinding",
	
	["The base for a totem of unlife"] = "unlifetotembase", 
	["The wood for a totem of unlife"] = "unlifetotemwood", 
	["The skull for a totem of unlife"] = "unlifetotemskull", 
	["The tendrils for a totem of unlife"] = "unlifetotemtendrils",

	["The obsidian for a soul sliver"] = "soulsliverobsidian", 
	["The fog for a soul sliver"] = "soulsliverfog", 
	["The souls for a soul sliver"] = "soulsliversouls", 
	["The curse for a soul sliver"] = "soulslivercurse",
	
	["The hilt for a culling blade"] = "cullingbladehilt", 
	["The edge of a culling blade"] = "cullingbladeedge", 
	["The metal for a culling blade"] = "cullingblademetal", 
	["The curse for a culling blade"] = "cullingbladecurse",
	
	["The cloth for a funeral shroud"] = "funeralshroudcloth", 
	["The thread for a funeral shroud"] = "funeralshroudthread", 
	["The benediction for a funeral shroud"] = "funeralshroudbenediction", 
	["The clasp for a funeral shroud"] = "funeralshroudclasp",

-- Renegades

	["The stick for mercenary's chalk"] = "mercenarychalkstick",
	["The chalkdust for mercenary's chalk"] = "mercenarychalkdust",
	["The binding for mercenary's chalk"] = "mercenarychalkbinding",
	["The chalk for mercenary's chalk"] = "mercenarychalkchalk",
	
	["The signature for an elemental injunction"] = "injunctionsignature",
	["The script for an elemental injunction"] = "injunctionscript",
	["The paper for an elemental injunction"] = "injunctionpaper",
	["The seal for an elemental injunction"] = "injunctionseal",
	
	["The cloth for a moppet"] = "moppetcloth",
	["The eyes for a moppet"] = "moppeteyes",
	["The thread for a moppet"] = "moppetthread",
	["The buttons for a moppet"] = "moppetbuttons",
	
	["The buttons for a turncoat's coat"] = "turncoatscoat",
	["The thread for a turncoat's coat"] = "turncoatscoatthread",
	["The cloth for a turncoat's coat"] = "turncoatscoatcloth",
	["The binding for a turncoat's coat"] = "turncoatscoatbinding",
	
	["The cloth for a shadowcloak"] = "shadowcloakcloth",
	["The clasp for a shadowcloak"] = "shadowcloakclasp",
	["The thread for a shadowcloak"] = "shadowcloakthread",
	["The curse for a shadowcloak"] = "shadowcloakcurse",
	
	["The cloth for a betrayer's mantle"] = "betrayersmantlecloth",
	["The thread for a betrayer's mantle"] = "betrayersmantlethread",
	["The straps for a betrayer's mantle"] = "betrayersmantlestraps",
	["The curse for a betrayer's mantle"] = "betrayersmantlecurse",
	
	["The stone for a turncoat's masque"] = "turncoatsmasquestone",
	["The etchings for a turncoat's masque"] = "turncoatsmasqueetchings",
	["The curse for a turncoat's masque"] = "turncoatsmasquecurse",
	["The eyes for a turncoat's masque"] = "turncoatsmasqueeyes",
	
	["The cloth for a sundered pennon"] = "sunderedpennoncloth",
	["The thread for a sundered pennon"] = "sunderedpennonthread",
	["The staff for a sundered pennon"] = "sunderedpennonstaff",
	["The binding for a sundered pennon"] = "sunderedpennonbinding",

--Invasion

	["The head of a figurine of the Dark Earth"] = "darkearthhead",
	["The torso of a figurine of the Dark Earth"] = "darkearthtorso",
	["The arms of a figurine of the Dark Earth"] = "darkeartharms",
	["The legs for a figurine of the Dark Earth"] = "darkearthlegs",

	["The wheels for a battering ram"] = "batteringramwheels",
	["The ram for a battering ram"] = "batteringramram",
	["The grips for a battering ram"] = "batteringramgrips",
	["Some bolts for a battering ram"] = "batteringrambolts",
	
	["The spikes for a steel caltrop"] = "caltropspikes",
	["The ball for a steel caltrop"] = "caltropball",
	["The binding for a steel caltrop"] = "caltropbinding",
	["The barbs for a steel caltrop"] = "caltropbarbs",
	
	["The pot for an iron cauldron"] = "cauldronpot",
	["The oil for an iron cauldron"] = "cauldronoil",
	["The handle for an iron cauldron"] = "cauldronhandle",
	["The base for an iron cauldron"] = "cauldronbase",
	
	["The link for an adamantine shackle"] = "shadowshacklelink",
	["The metal for an adamantine shackle"] = "shadowshacklemetal",
	["The enchantment for an adamantine shackle"] = "shadowshackleenchantment",
	["The shadow for an adamantine shackle"] = "shadowshackleshadow",
	
	["The lid for a hag's eye"] = "hagseyelid",
	["The ball for a hag's eye"] = "hagseyeball",
	["The fluid for a hag's eye"] = "hagseyefluid",
	["The enchantment for a hag's eye"] = "hagseyeenchantment",
	
	["Some magic ice"] = "icebrickmagic",
	["The repeating spell for a block of ice"] = "icebrickspell",
	["The binding for a block of ice"] = "icebrickbinding",
	["The enchantment spell for a block of ice"] = "icebrickenchantment",
	
	["The enchantment for a map"] = "scoutingmapenchantment",
	["The icons	for a map"] = "scoutingmapicons",
	["The ink for a map"] = "scoutingmapink",
	["The vellum for a map"] = "scoutingmapvellum",

-- WAR
  
	["the bones for some rotting remains"] = "remainsbones",
	["the flesh for some rotting remains"] = "remainsflesh",
	["the muscles for some rotting remains"] = "remainsmuscles",
	["the blood for some rotting remains"] = "remainsblood",
 
	["the gilding for a gilded bit"] = "bitgilding",
	["the bar for a gilded bit"] = "bitbar",
	["the chain for a gilded bit"] = "bitchain",
	["the patterns for a gilded bit"] = "bitpatterns",
 
	["the head of a portly pigeon"] = "pigeonhead",
	["the body of a portly pigeon"] = "pigeonbody",
	["the legs of a portly pigeon"] = "pigeonlegs",
	["the wings of a portly pigeon"] = "pigeonwings",
 
	["the fog for a cloud of war"] = "warcloudfog",
	["the stench for a cloud of war"] = "warcloudstench",
	["the curse for a cloud of war"] = "warcloudcurse",
	["the binding for a cloud of war"] = "warcloudbinding",
 
	["the steel for a portal hoop"] = "portalhoopsteel",
	["the light for a portal hoop"] = "portalhooplight",
	["the enchantment for a portal hoop"] = "portalhoopenchantment",
	["the binding for a portal hoop"] = "portalhoopbinding",
 
	["the metal for an observant sigil"] = "observantsigilmetal",
	["the star for an observant sigil"] = "observantsigilstar",
	["the eye for an observant sigil"] = "observantsigileye",
	["the latice for an observant sigil"] = "observantsigillatice",

}

-- require this info for formatting and complete set management (note, can be extended)
-- frustratingly, being an unsorted table, this also required the additional order in the set data or I couldnt handle the formatting..
talisman.info = {
	blackdragon = {
			blackdragonbone = {required=64, short="bone"}, 
			blackdragonclaw = {required=64, short="claw"}, 
			blackdragoneye = {required=64, short="eye"}, 
			blackdragonheart = {required=64, short="heart"}, 
			blackdragonleather = {required=64, short="leather"}, 
			blackdragonscale = {required=64, short="scale"}, 
			blackdragontooth = {required=64, short="tooth"}, 
			blackdragonsac = {required=4, short="sac"}
		},
	greendragon = {
			greendragonbone = {required=64, short="bone"}, 
			greendragonclaw = {required=64, short="claw"}, 
			greendragoneye = {required=64, short="eye"}, 
			greendragonheart = {required=64, short="heart"}, 
			greendragonleather = {required=64, short="leather"}, 
			greendragonscale = {required=64, short="scale"}, 
			greendragontooth = {required=64, short="tooth"}, 
			greendragonsac = {required=4, short="sac"}
		},
	reddragon = {
			reddragonbone = {required=64, short="bone"}, 
			reddragonclaw = {required=64, short="claw"}, 
			reddragoneye = {required=64, short="eye"}, 
			reddragonheart = {required=64, short="heart"}, 
			reddragonleather = {required=64, short="leather"}, 
			reddragonscale = {required=64, short="scale"}, 
			reddragontooth = {required=64, short="tooth"}, 
			reddragonbelly = {required=4, short="belly"}
		},
	bluedragon = {
			bluedragonbone = {required=64, short="bone"}, 
			bluedragonclaw = {required=64, short="claw"}, 
			bluedragoneye = {required=64, short="eye"}, 
			bluedragonheart = {required=64, short="heart"}, 
			bluedragonleather = {required=64, short="leather"}, 
			bluedragonscale = {required=64, short="scale"}, 
			bluedragontooth = {required=64, short="tooth"}, 
			bluedragonlung = {required=4, short="lung"}
		},
	silverdragon = {
			silverdragonbone = {required=64, short="bone"}, 
			silverdragonclaw = {required=64, short="claw"}, 
			silverdragoneye = {required=64, short="eye"}, 
			silverdragonheart = {required=64, short="heart"}, 
			silverdragonleather = {required=64, short="leather"}, 
			silverdragonscale = {required=64, short="scale"}, 
			silverdragontooth = {required=64, short="tooth"}, 
			silverdragonlarynx = {required=4, short="larynx"}
		},
	golddragon = {
			golddragonbone = {required=64, short="bone"}, 
			golddragonclaw = {required=64, short="claw"}, 
			golddragoneye = {required=64, short="eye"}, 
			golddragonheart = {required=64, short="heart"}, 
			golddragonleather = {required=64, short="leather"}, 
			golddragonscale = {required=64, short="scale"}, 
			golddragontooth = {required=64, short="tooth"}, 
			golddragonstem = {required=4, short="stem"}
		},
-- AZATLAN
	eagleheaddress = {
			bluefeather = {required=64, short="blue"}, 
			greenfeather = {required=64, short="green"}, 
			redfeather = {required=64, short="red"}, 
			yellowfeather = {required=64, short="yellow"}, 
			orangefeather = {required=16, short="orange"}, 
			purplefeather = {required=16, short="purple"}, 
			blackfeather = {required=4, short="black"}, 
		},
	atlatl = {
			atlatlshaft = {required=1, short="shaft"}, 
			atlatlcup = {required=1, short="cup"}, 
			atlatlspear = {required=1, short="spear"}, 
	},
	transoceanic = {
			orbleft = {required=4, short="left"}, 
			orbright = {required=4, short="right"}, 
			orbcenter = {required=2, short="center"}, 
	},
	azatlanknife = {
			knifebladetop = {required=1, short="tip"}, 
			knifebladebottom = {required=1, short="tang"}, 
			knifeleather = {required=1, short="leather"}, 
	},
	quetzal = {
			quetzalredfeather = {required=64, short="red"}, 
			quetzalbluefeather = {required=64, short="blue"}, 
			quetzalgreenfeather = {required=64, short="green"}, 
			quetzalcage = {required=64, short="cage"}, 
			quetzaltalon = {required=16, short="talon"}, 
			quetzalegg = {required=4, short="egg"}, 
	},
	kinkajou= {
			kinkajoutooth = {required=64, short="tooth"}, 
			kinkajoucollar = {required=64, short="collar"}, 
			kinkajoubait = {required=64, short="bait"}, 
			kinkajouclaw = {required=32, short="claw"}, 
			kinkajoupaw = {required=16, short="paw"}, 
			kinkajoutail = {required=4, short="tail"}, 
	},
	coati= {
			coatitooth = {required=16, short="tooth"}, 
			coaticollar = {required=64, short="collar"}, 
			coatibait = {required=64, short="bait"}, 
			coaticlaw = {required=64, short="claw"}, 
			coatipaw = {required=32, short="paw"}, 
			coatitail = {required=4, short="tail"}, 
	},
--Wonders
	baitbucket = {
			buckethandle = {required=1, short="handle"}, 
			bucketleft = {required=1, short="left"},
			bucketright = {required=1, short="right"},
			bucketbase = {required=1, short="base"},
			bucketwater = {required=1, short="water"}
	},
	dragonskinpack = {
			packscales = {required=1, short="scales"},
			packstraps = {required=1, short="straps"},
			packlining = {required=1, short="lining"},
			packthread = {required=1, short="thread"},
			packleather = {required=1, short="leather"},
	},
	platinumwhistle = {
			whistlemouth = {required=1, short="mouth"},
			whistleflue = {required=1, short="flue"},
			whistlereed = {required=1, short="reed"},
			whistletoppipe = {required=1, short="top"},
			whistlelowpipe = {required=1, short="bottom"},
	},
	ramshorn = {
			ramshorn = {required=1, short="horn"},
			hornmouth = {required=1, short="mouth"},
			hornleftstrap = {required=1, short="left"},
			hornrightstrap = {required=1, short="right"},
			hornfastener = {required=1, short="fastener"},
	},
	monocle = {
			monotop = {required=1, short="top"},
			monobottom = {required=1, short="bottom"},
			monoframe = {required=1, short="frame"},
			monocatch = {required=1, short="catch"},
			monoclasp = {required=1, short="clasp"},
	},
  globe = {
    globetop = {required=1, short="top"},
    globemiddle = {required=1, short="middle"},
    globebottom = {required=1, short="bottom"},
  },
--Misc
	hookah = {
			hookahbase = {required=1, short="base"},
			hookahbowl = {required=1, short="bowl"},
			hookahhood = {required=1, short="hood"},
			hookahchain = {required=1, short="chain"},
			hookahhoses = {required=1, short="hose"},
			hookahstem = {required=1, short="stem"},
			hookahplate = {required=1, short="plate"},
	},
	tapestry = {
			tapestryclaw = {required=1, short="claw"},
			tapestryonyx = {required=1, short="onyx"},
			tapestryroller = {required=1, short="roller"},
			tapestryvellum = {required=1, short="vellum"},
	},
	vaultkey = {
			keyfragment = {required=1, short="keyfragment"},
	},
	negationsphere = {
			spherefragment = {required=1, short="spherefragment"},
	},
	clayfigurine = {
			clayfigurinearms = {required=1, short="arms"},
			clayfigurinelegs = {required=1, short="legs"},
			clayfigurinehead = {required=1, short="head"},
			clayfigurinebody = {required=1, short="body"},
	},
--Historical
	window = {
			windowframe = {required=1, short="frame"},
			windowpane = {required=1, short="pane"},
			windowjamb = {required=1, short="jamb"},
			windowshutters = {required=1, short="shutters"},
			windowgrid = {required=1, short="grid"},
	},
	mantle = {
			mantlecloth = {required=1, short="cloth"},
			mantlethread = {required=1, short="thread"},
			mantlecentre = {required=1, short="centre"},
			mantlegems = {required=1, short="gems"},
	},
	icicle = {
			icicletop = {required=1, short="top"},
			iciclemiddle = {required=1, short="middle"},
			iciclebase = {required=1, short="base"},
			icicletip = {required=1, short="tip"},
			iciclerunes = {required=1, short="runes"},
	},
	helmet = {
			helmetskull = {required=1, short="skull"},
			helmetnose = {required=1, short="nose"},
			helmetstrap = {required=1, short="strap"},
	},
	disc = {
			disctop = {required=1, short="top"},
			discside = {required=1, short="side"},
			discmiddle = {required=1, short="middle"},
			discbottom = {required=1, short="bottom"},
			discrunes = {required=1, short="runes"},
			disccentre = {required=1, short="centre"},
	},
	votive = {
			votivebase = {required=1, short="base"},
			votivewick = {required=1, short="wick"},
			votivewax = {required=1, short="wax"},
	},
	whisperstone = {
			stonetop = {required=1, short="top"},
			stonebottom = {required=1, short="bottom"},
			stonemiddle = {required=1, short="middle"},
			stoneside = {required=1, short="side"},
			stonecore = {required=1, short="core"},
			stoneemitter= {required=1, short="emitter"},
	},
	lily = {
			lilypetals = {required=1, short="petals"},
			lilystem = {required=1, short="stem"},
			lilystamen = {required=1, short="stamen"},
			lilybulb = {required=1, short="bulb"},
			lilypistil = {required=1, short="pistil"},
	},
	ozhera = {
			ozherabait = {required=1, short="bait"},
			ozheracollar = {required=1, short="collar"},
			ozheraegg = {required=1, short="egg"},
			ozheraclaw = {required=1, short="claw"},
			ozherabeak = {required=1, short="beak"},
			ozheranest = {required=1, short="nest"},
	},
	turtle = {
			turtleshell = {required=1, short="shell"},
			turtlebait = {required=1, short="bait"},
			turtlecollar = {required=1, short="collar"},
			turtletail = {required=1, short="tail"},
			turtlefoot= {required=1, short="foot"},
			turtletongue= {required=1, short="tongue"},
	},
	mongoose = {
			mongoosebait = {required=1, short="bait"},
			mongoosecollar = {required=1, short="collar"},
			mongoosetail = {required=1, short="tail"},
			mongoosepaw = {required=1, short="paw"},
			mongooseclaw = {required=1, short="claw"},
			mongoosefang = {required=1, short="fang"},
	},
	hellcat = {
			hellcatbait = {required=1, short="bait"},
			hellcatcollar = {required=1, short="collar"},
			hellcatclaw = {required=1, short="claw"},
			hellcatfang = {required=1, short="fang"},
			hellcattail = {required=1, short="tail"},
			hellcatpaw = {required=1, short="paw"},
	},
--Conclave
	tophat = {
			tophatlining = {required=1, short="lining"},
			tophatbrim= {required=1, short="brim"},
			tophatthread = {required=1, short="thread"},
			tophatband = {required=1, short="band"},
	},
	hourglass = {
			hourglasstop = {required=1, short="top"},
			hourglassbottom= {required=1, short="bottom"},
			hourglasssand = {required=1, short="sand"},
			hourglassbulb= {required=1, short="bulb"},
	},
	tempestbrooch = {
			broochgem= {required=1, short="gem"},
			broochclasp= {required=1, short="clasp"},
			broochmetal= {required=1, short="metal"},
			broochhook = {required=1, short="hook"},
	},
	elementsprite = {
			spritelegs= {required=1, short="legs"},
			spritearms= {required=1, short="arms"},
			spritetorso= {required=1, short="torso"},
			spritehead= {required=1, short="head"},
	},
	lesservault = {
			vaultdoor= {required=1, short="door"},
			vaulthinge= {required=1, short="hinge"},
			vaulthandle= {required=1, short="handle"},
			vaultgems= {required=1, short="gems"},
	},
	flyingring = {
			ringtop = {required=1, short="top"},
			ringbottom = {required=1, short="bottom"},
			ringinside = {required=1, short="inside"},
			ringoutside = {required=1, short="outside"},
	},
	celerity = {
			armbandtop = {required=1, short="top"},
			armbandbottom = {required=1, short="bottom"},
			armbandinside = {required=1, short="inside"},
			armbandoutside = {required=1, short="outside"},
	},
	buckawns = {
			amuletthread = {required=1, short="thread"},
			amuletchain = {required=1, short="chain"},
			amuletball = {required=1, short="ball"},
			amuletclasp = {required=1, short="clasp"},
	},
	adaptgrimoire = {
			grimoireleather = {required=1, short="leather"},
			grimoirepaper = {required=1, short="paper"},
			grimoiregems = {required=1, short="gems"},
			grimoirelock = {required=1, short="lock"},
	},
	stygianpendant = {
			pendantbase = {required=1, short="base"},
			pendantclasp = {required=1, short="clasp"},
			pendantpearl = {required=1, short="pearl"},
			pendanthook = {required=1, short="hook"},
	},
	grandmagi = {
			robesthread = {required=1, short="thread"},
			robesneedle = {required=1, short="needle"},
			robestrim = {required=1, short="trim"},
			robesfabric = {required=1, short="fabric"},
	},
	atavianwings = {
			wingsthread = {required=1, short="thread"},
			wingsleft = {required=1, short="left"},
			wingsright = {required=1, short="right"},
			wingsfeathers = {required=1, short="feathers"},
	},
--MARKS
	ivorywarhorn = {
			ivoryhornmouthpiece = {required=1, short="mouth"},
			ivoryhornfittings = {required=1, short="fittings"},
			ivoryhornleft = {required=1, short="left"},
			ivoryhornright = {required=1, short="right"},
	},
	ivorymedallion = {
			ivorymedalliondisc = {required=1, short="disc"},
			ivorymedallionclasp = {required=1, short="clasp"},
			ivorymedallionaccent = {required=1, short="accent"},
			ivorymedallionribbon = {required=1, short="ribbon"},
	},
	ivoryspyglass = {
			ivoryspyglasslens = {required=1, short="lens"},
			ivoryspyglasseyepiece = {required=1, short="eye"},
			ivoryspyglassbody = {required=1, short="body"},
			ivoryspyglassstrap = {required=1, short="strap"},
	},
	ivorypennon = {
			ivorypennonsilk = {required=1, short="silk"},
			ivorypennonribbon = {required=1, short="ribbon"},
			ivorypennonthread = {required=1, short="thread"},
			ivorypennondye = {required=1, short="dye"},
	},
	ivoryarmband = {
			ivoryarmbandaccent = {required=1, short="accent"},
			ivoryarmbandouter = {required=1, short="outer"},
			ivoryarmbandinner = {required=1, short="inside"},
			ivoryarmbandclasp = {required=1, short="clasp"},
	},
	ivoryatlantia = {
			ivoryatlantiabody = {required=1, short="body"},
			ivoryatlantialegs = {required=1, short="legs"},
			ivoryatlantiahead = {required=1, short="head"},
			ivoryatlantiaarms = {required=1, short="arms"},
	},
	ivorydummy = {
			ivorydummylimbs = {required=1, short="limbs"},
			ivorydummytorso = {required=1, short="torso"},
			ivorydummyclothing = {required=1, short="clothing"},
			ivorydummyarmour = {required=1, short="armour"},
	},
	ivorytower = {
			ivorytowerbase = {required=1, short="base"},
			ivorytowerlower = {required=1, short="lower"},
			ivorytowerupper = {required=1, short="upper"},
			ivorytowerlacquer = {required=1, short="laquer"},
	},
	ivorybowstring = {
			ivorybowstringcore = {required=1, short="core"},
			ivorybowstringwrapping = {required=1, short="wrap"},
			ivorybowstringeyelet = {required=1, short="eyelet"},
			ivorybowstringenchant = {required=1, short="enchant"},
	},
	quisalisdagger = {
			quisaisdaggerhilt = {required=1, short="hilt"},
			quisalisdaggerblade = {required=1, short="blade"},
			quisalisdaggerpommel = {required=1, short="pommel"},
			quisalisdaggergrip = {required=1, short="grip"},
	},
	quisalisbone = {
			quisalisbonelower = {required=1, short="lower"},
			quisalisboneupper = {required=1, short="upper"},
			quisalisbonerope = {required=1, short="rope"},
			quisalisbonestain = {required=1, short="stain"},
	},
	quisalismedallion = {
			quisalismedallionchain = {required=1, short="chain"},
			quisalismedalliontop = {required=1, short="top"},
			quisalismedallionbottom = {required=1, short="bottom"},
			quisalismedallionclasp = {required=1, short="clasp"},
	},
	quisalislookingglass = {
			quisalisglasscase = {required=1, short="case"},
			quisalisglasslens = {required=1, short="lens"},
			quisalisglassiris = {required=1, short="iris"},
			quisalisglasseyepiece = {required=1, short="eyepiece"},
	},
	quisalisderillin = {
			quisalisderillinhair = {required=1, short="hair"},
			quisalisderillinclothing = {required=1, short="clothing"},
			quisalisderillintorso = {required=1, short="torso"},
			quisalisderillinhead = {required=1, short="head"},
	},
	quisalisdummy = {
			quisalisdummylimbs = {required=1, short="limbs"},
			quisalisdummytorso = {required=1, short="torso"},
			quisalisdummyrobes = {required=1, short="robes"},
			quisalisdummytargets = {required=1, short="targets"},
	},
	quisalistombstone = {
			quisalistombstonetop = {required=1, short="top"},
			quisalistombstonemiddle = {required=1, short="middle"},
			quisalistombstonebase = {required=1, short="base"},
			quisalistombstonescript = {required=1, short="script"},
	},
	quisalisarmband = {
			quisalisarmbandserpent = {required=1, short="insignia"},
			quisalisarmbandeyes = {required=1, short="eyes"},
			quisalisarmbandtop = {required=1, short="top"},
			quisalisarmbandbottom = {required=1, short="bottom"},
	},
	quisalismask = {
			quisalismaskbone = {required=1, short="bone"},
			quisalismaskwire = {required=1, short="wire"},
			quisalismaskteeth = {required=1, short="teeth"},
			quisalismaskrunes = {required=1, short="runes"},
	},
	quisaliscloak = {
			quisaliscloakcloth = {required=1, short="cloth"},
			quisaliscloakembroidery = {required=1, short="embroid"},
			quisaliscloaklining = {required=1, short="lining"},
			quisaliscloakhood = {required=1, short="hood"},
	},
--Seafaring
	cloverbox = {
			cloverboxclovers = {required=1, short="clovers"},
			cloverboxlid = {required=1, short="lid"},
			cloverboxsides = {required=1, short="sides"},
			cloverboxbase = {required=1, short = "base"},
	},
	maelstrom = {
			maelstromarms = {required=1, short="arms"},
			maelstromlegs = {required=1, short="legs"},
			maelstromtorso = {required=1, short="torso"},
			maelstromhead = {required=1, short="head"},
	},
	islandwings = {
			islandwingsleft = {required=1, short="left"},
			islandwingsright = {required=1, short="right"},
			islandwingsthread = {required=1, short="thread"},
			islandwingsstraps = {required=1, short="straps"},
	},
	frostpail = {
			frostpailhandle = {required=1, short="handle"},
			frostpailleft = {required=1, short="left"},
			frostpailright = {required=1, short="right"},
			frostpailbase = {required=1, short="base"},
	},
	neatpail = {
			neatpailhandle = {required=1, short="handle"},
			neatpailleft = {required=1, short="left"},
			neatpailright = {required=1, short="right"},
			neatpailbase = {required=1, short="base"},
	},
	shipchit = {
			shipchittop = {required=1, short="top"},
			shipchitbottom = {required=1, short="bottom"},
			shipchitink = {required=1, short="ink"},
			shipchitseal = {required=1, short="seal"},
	},
	xpplaque = {
			xpplaquemount = {required=1, short="mount"},
			xpplaquefascia = {required=1, short="fascia"},
			xpplaquelacquer = {required=1, short="lacquer"},
			xpplaquelettering = {required=1, short="lettering"},
	},
	monstermap = {
			monstermapink = {required=1, short="ink"},
			monstermapparchment = {required=1, short="parchment"},
			monstermapcompass = {required=1, short="compass"},
			monstermapenchant = {required=1, short="enchant"},
	},
	crossbow = {
			crossbowmount = {required=1, short="mount"},
			crossbowarms = {required=1, short="arms"},
			crossbowstring = {required=1, short="string"},
			crossbowcrank = {required=1, short="crank"},
	},
	glassbottle = {
			glassbottleneck = {required=1, short="neck"},
			glassbottlemiddle = {required=1, short="middle"},
			glassbottlebase = {required=1, short="base"},
			glassbottleenchant = {required=1, short="enchant"},
	},
	seaweedpail = {
			seaweedpailhandle = {required=1, short="handle"},
			seaweedpailleft = {required=1, short="left"},
			seaweedpailright = {required=1, short="right"},
			seaweedpailbase = {required=1, short="base"},
	},
	smokeflare = {
			smokeflareshell = {required=1, short="shell"},
			smokeflarefins = {required=1, short="fins"},
			smokeflarelid = {required=1, short="lid"},
			smokeflarechamber = {required=1, short="chamber"},
	},
--Death
	mortalcoil = {
			coilbinding = {required=1, short="binding"},
			coilbottom = {required=1, short="bottom"},
			coilstrand = {required=1, short="strand"},
			coiltop = {required=1, short="top"},
	},
	vulturetalon = {
			talontip = {required=1, short="tip"},
			talonstem = {required=1, short="stem"},
			talonbase = {required=1, short="base"},
			talonpoison = {required=1, short="poison"},
	},
	deathcandle = {
			candlebase = {required=1, short="base"},
			candleflame = {required=1, short="flame"},
			candlestring = {required=1, short="string"},
			candlewax = {required=1, short="wax"},
	},
	deathdummy = {
			deathdummyarms = {required=1, short="arms"},
			deathdummyhead = {required=1, short="head"},
			deathdummytorso = {required=1, short="torso"},
			deathdummylegs = {required=1, short="legs"},
	},
	gravestone = {
			gravestonebottom = {required=1, short="bottom"},
			gravestoneinscription = {required=1, short="inscription"},
			gravestonelichen = {required=1, short="lichen"},
			gravestonetop = {required=1, short="top"},
	},
	crucible = {
			cruciblebase = {required=1, short="base"},
			cruciblebowl = {required=1, short="bowl"},
			crucibleflame = {required=1, short="flame"},
			cruciblehandle = {required=1, short="handle"},
	},
	deathscall = {
			deathscallcoil = {required=1, short="coil"},
			deathscallhorn = {required=1, short="horn"},
			deathscallmouth = {required=1, short="mouth"},
			deathscalltassels = {required=1, short="tassels"},
	},
	deathcape = {
			capebrocade = {required=1, short="brocade"},
			capeenchantment = {required=1, short="enchantment"},
			capethread = {required=1, short="thread"},
			capevelvet = {required=1, short="velvet"},
	},
--Blackwave
	taper = {
			tapertop = {required=1, short="top"}, 
			taperbottom = {required=1, short="bottom"},
			taperwax = {required=1, short="wax"},
			taperstring = {required=1, short="string"},
	},
	finalityring = {
			signetband = {required=1, short="band"},
			signetbezel = {required=1, short="bezel"},
			signetcarving = {required=1, short="carving"},
			signetmarks = {required=1, short="marks"},
	},
	grievouskeyring = {
			keyringlizard = {required=1, short="lizard"},
			keyringtiger = {required=1, short="tiger"},
			keyringslate = {required=1, short="slate"},
			keyringhoop = {required=1, short="hoop"},
	},
	goblin = {
			goblinlegs = {required=1, short="legs"},
			goblinarms = {required=1, short="arms"},
			goblinhead = {required=1, short="head"},
			goblintorso = {required=1, short="torso"},
	},
	blackspigot = {
			spigottop = {required=1, short="top"},
			spigotbottom = {required=1, short="bottom"},
			spigotstem = {required=1, short="stem"},
			spigottip = {required=1, short="tip"},
	},
	sunlesshope = {
			sunlessband = {required=1, short="band"},
			sunlessstone = {required=1, short="stone"},
			sunlessbinding = {required=1, short="binding"},
			sunlessenchantment = {required=1, short="enchant"},
	},
	blackcirclet = {
			circletfur = {required=1, short="fur"},
			circletblades = {required=1, short="blades"},
			circletband = {required=1, short="band"},
			circletbinding = {required=1, short="binding"},
	},
	jewel = {
			sanguinestone = {required=1, short="stone"},
			sanguineaura = {required=1, short="aura"},
			sanguineteardrop = {required=1, short="tear"},
			taintedblood = {required=1, short="blood"},
	},
	canopic = {
			canopiclid = {required=1, short="lid"},
			canopicfluid = {required=1, short="fluid"},
			canopicbase = {required=1, short="base"},
			canopicpot = {required=1, short="pot"},
	},
	apperceptionstone = {
			crystalshard = {required=1, short="shard"},
			crystalbinding = {required=1, short="binding"},
			crystalportal = {required=1, short="portal"},
			crystalbase = {required=1, short="base"},
	},
	guise = {
			guiseenchantment = {required=1, short="enchant"},
			guisethread = {required=1, short="thread"},
			guisesmile = {required=1, short="smile"},
			guiseleather = {required=1, short="leather"},
	},
	blackgrimoire = {
			grimoiregut = {required=1, short="gut"},
			grimoirescroll = {required=1, short="scroll"},
			grimoirecover = {required=1, short="cover"},
			grimoirebinding = {required=1, short="binding"},
	},
	["suremekh'neina"] = {
			mantleenchant = {required=1, short="enchant"},
			mantleclasp = {required=1, short="clasp"},
			mantlelining = {required=1, short="lining"},
			mantlefabric = {required=1, short="fabric"},
	},
--RACES
	lodestone = {
			lodestonetop = {required=1, short="top"},
			lodestonebase = {required=1, short="base"},
			lodestoneright = {required=1, short="right"},
			lodestoneleft = {required=1, short="left"},
	},
	arachnideye = {
			arachnidlens = {required=1, short="lens"},
			arachnideyeball = {required=1, short="eyeball"},
			arachnidenchantment = {required=1, short="enchant"},
			arachnidcolour = {required=1, short="colour"},
	},
	panpipes = {
			panpipepipes = {required=1, short="pipes"},
			panpipefeathers = {required=1, short="feathers"},
			panpipehair = {required=1, short="hair"},
			panpipeflutes = {required=1, short="flutes"},
	},
	chitin = {
			chitincolour = {required=1, short="colour"},
			chitinname = {required=1, short="name"},
			chitincarving = {required=1, short="carving"},
			chitinfragment = {required=1, short="fragment"},
	},
	rattle = {
			rattlebones = {required=1, short="bones"},
			rattleantlers = {required=1, short="antlers"},
			rattlerunes = {required=1, short="runes"},
			rattlestaff = {required=1, short="staff"},
	},
	whispercloth = {
			clothenchantment = {required=1, short="enchant"},
			clothbinding = {required=1, short="binding"},
			clothblood = {required=1, short="blood"},
			whispersilk = {required=1, short="silk"},
	},
	demolitionsphere = {
			sphereglass = {required=1, short="glass"},
			spherefire = {required=1, short="fire"},
			spherespark = {required=1, short="spark"},
			sphererunes = {required=1, short="runes"},
	},
	sirensong = {
			sirenglass = {required=1, short="glass"},
			sirenvoice = {required=1, short="voice"},
			sirencork = {required=1, short="cork"},
			sirensmoke = {required=1, short="smoke"},
	},
	catapult = {
			catapultframe = {required=1, short="frame"},
			catapultbolts = {required=1, short="bolts"},
			catapultwheel = {required=1, short="wheel"},
			catapultarm = {required=1, short="arm"},
	},
	dalamyrrclaws = {
			clawstraps = {required=1, short="straps"},
			clawbase = {required=1, short="base"},
			clawpoints = {required=1, short="points"},
			clawbarbs = {required=1, short="barbs"},
	},
	frogskin = {
			froghead = {required=1, short="head"},
			frogcord = {required=1, short="cord"},
			frogbody = {required=1, short="body"},
			frogfeet = {required=1, short="feet"},
	},
	mayafigurine = {
			figurinehead = {required=1, short="head"},
			figurinearms = {required=1, short="arms"},
			figurinetorso = {required=1, short="torso"},
			figurinelegs = {required=1, short="legs"},
	},
 -- Forays
  arankeshfeather = {
			arankeshfeatherspine = {required=4, short="spine"},
			arankeshfeatherdown = {required=4, short="down"},
			arankeshfeathercolour = {required=4, short="colouration"},
			arankeshfeatheredge = {required=4, short="edge"},
	},	
	icossemirror = {
			goldmirrorframe = {required=4, short="frame"},
			mirrorglass = {required=4, short="glass"},
			mirrorcurse = {required=4, short="curse"},
			mirrorinscription = {required=4, short="inscription"},
	},
	ogrebroth = {
			brothbowl = {required=4, short="bowl"},
			brothbroth = {required=4, short="broth"},
			brothseasoning = {required=4, short="seasons"},
			brothspice = {required=4, short="spice"},
	},
	boulder = {
			boulderchipping = {required=4, short="chipping"},
			bouldershell = {required=4, short="shell"},
			bouldercore = {required=4, short="core"},
			boulderstone = {required=4, short="stone"},
	},
	margamwheel = {
			margamwheelweeds = {required=2, short="weeds"},
			margamwheelbolts = {required=2, short="bolts"},
			margamwheelwood = {required=2, short="wood"},
			margamwheelcentre = {required=2, short="centre"},
	},
	foraymap = {
			mapfragmenttop = {required=8, short="top"},
			mapfragmentbottom = {required=8, short="bottom"},
			mapfragmentleft = {required=8, short="left"},
			mapfragmentright = {required=8, short="right"},
	},
--Cities
	musicbox = {
			musicboxsong = {required=2, short="song"},
			musicboxmechanism = {required=2, short="mechan"},
			musicboxframe = {required=2, short="frame"},
			musicboxcrank = {required=2, short="crank"},
	},
	biscuit = {
			biscuitbase = {required=1, short="base"},
			biscuitspecial = {required=2, short="spec"},
			biscuitsugar = {required=1, short="sugar"},
			biscuitsalt = {required=1, short="salt"},
	},
	wraithshackles = {
			wraithshacklesmoke = {required=1, short="smoke"},
			wraithshacklechain = {required=1, short="chain"},
			wraithshacklemanacles = {required=2, short="manac"},
			wraithshacklelock = {required=1, short="lock"},
	},
	tumbleweed = {
			tumbleweedroots = {required=1, short="roots"},
			tumbleweedtendrils = {required=1, short="tendril"},
			tumbleweedvines = {required=1, short="vines"},
			tumbleweedstem = {required=1, short="stem"},
	},
	alabasterurn = {
			alabasterurnlid = {required=1, short="lid"},
			alabasterurnpot = {required=1, short="pot"},
			alabasterurninscription = {required=1, short="inscr"},
			alabasterurnash = {required=1, short="ash"},
	},
	celescope = {
			celescopeglobe = {required=2, short="globe"},
			celescopecylinders = {required=2, short="cylin"},
			celescopeeyepiece = {required=2, short="eyep"},
			celescopeingraving = {required=2, short="ingra"},
	},
-- Monks
	monkdummy = {
			monkdummyhead = {required=1, short="head"},
			monkdummyarms = {required=1, short="arms"},
			monkdummytorso = {required=1, short="torso"},
			monkdummylegs = {required=1, short="legs"},
	},
	odysseantongue = {
			tongueflesh = {required=1, short="flesh"},
			tonguecasing = {required=1, short="casing"},
			tonguepolish = {required=1, short="polish"},
			tonguecurse = {required=1, short="curse"},
	},
	monkheadband = {
			monkheadbandthreads = {required=1, short="threads"},
			monkheadbandamethyst = {required=1, short="amethyst"},
			monkheadbandenchantment = {required=1, short="enchant"},
			monkheadbandsupport = {required=1, short="support"},
	},
	talonedring = {
			crimsonsteelband = {required=1, short="band"},
			quartzsetting = {required=1, short="setting"},
			ringsteelclaws = {required=1, short="claw"},
			talonedringbinding = {required=1, short="binding"},
	},
	cranepennon = {
			pennoncloth = {required=1, short="cloth"},
			pennoncranes = {required=1, short="cranes"},
			pennonstaff = {required=1, short="staff"},
			pennonthread = {required=1, short="thread"},
	},
	monkbanner = {
			monkbannerflag = {required=1, short="flag"},
			monkbannerembroidery = {required=1, short="embroidery"},
			monkbannerspear = {required=1, short="spear"},
			monkbannerthread = {required=1, short="thread"},
	},
	ashstaff = {
			ashstaffstave = {required=1, short="stave"},
			ashstaffstrapping = {required=1, short="strap"},
			ashstaffcap = {required=1, short="cap"},
			ashstaffshoe = {required=1, short="shoe"},
	},
	olivebranch = {
			olivewood = {required=1, short="wood"},
			olivebranchshoots = {required=1, short="shoots"},
			oliveleaves = {required=1, short="leaves"},
			olivebranchenchantment = {required=1, short="enchant"},
	},	
-- Elementals
	airelement = {
			airelementalcyclone = {required=1, short="cyclone"},
			airelementalessence = {required=1, short="essence"},
			airelementalbinding = {required=1, short="binding"},
			airelementallightning = {required=1, short="lightning"},
	},
	airbrooch = {
			airbroochclasp = {required=1, short="clasp"},
			airbroochgem = {required=1, short="gem"},
			airbroochsetting = {required=1, short="setting"},
			airbroochenchantment = {required=1, short="enchant"},
	},
	firependant = {
			firependantchain = {required=1, short="chain"},
			firependantflame = {required=1, short="flame"},
			firependantsetting = {required=1, short="setting"},
			firependantjewel = {required=1, short="jewel"},
	},
	jawbone = {
			jawboneteeth = {required=1, short="teeth"},
			jawbonemandibles = {required=1, short="mandibles"},
			jawbonebone = {required=1, short="bone"},
			jawbonehinge = {required=1, short="hinge"},
	},
	earthenshovel = {
			earthshovelwood = {required=1, short="wood"},
			earthshovelblade = {required=1, short="blade"},
			earthshovelbinding = {required=1, short="binding"},
			earthshovelminerals = {required=1, short="minerals"},
	},
	seatears = {
			seatearsphial = {required=1, short="phial"},
			seatearsstopper = {required=1, short="stopper"},
			seatearspaint = {required=1, short="paint"},
			seatearstears = {required=1, short="tears"},
	},
	garashshackle = {
			garashshacklelinks = {required=1, short="links"},
			garashshackleorbs = {required=1, short="orbs"},
			garashshackleenchantment = {required=1, short="enchant"},
			garashshacklechains = {required=1, short="chains"},
	},
	mudbomb = {
			mudbombbinding = {required=1, short="binding"},
			mudbombmud = {required=3, short="mud"},
	},
	searedglyph = {
			searedglyphplaque = {required=1, short="plaque"},
			searedglyphemblem = {required=1, short="emblem"},
			searedglyphtendrils = {required=1, short="tendrils"},
			searedglyphflame = {required=1, short="flame"},
	},
	firetank = {
			firetankframe = {required=1, short="frame"},
			firetankflame = {required=1, short="flame"},
			firetankinsignia = {required=1, short="insignia"},
			firetanklinks = {required=1, short="links"},
	},
	sceptre = {
			sceptrescript = {required=1, short="script"},
			sceptreenchantment = {required=1, short="enchant"},
			sceptreheart = {required=1, short="heart"},
			sceptretusk = {required=1, short="tusk"},
	},
	harness = {
			airharnessstraps = {required=1, short="straps"},
			airharnessglyphs = {required=1, short="glyphs"},
			airharnessenchantment = {required=1, short="enchant"},
			airharnessbuckles = {required=1, short="buckles"},
	},
--Yggdrasil
	dreadpilar = {
			dreadpilarbody = {required=1, short="body"},
			dreadpilarhead = {required=1, short="head"},
			dreadpilarlegs = {required=1, short="legs"},
			dreadpilarplates = {required=1, short="plates"},
	},
	squargon = {
			squargonbody = {required=1, short="body"},
			squargonfangs = {required=1, short="fangs"},
			squargonhead = {required=1, short="head"},
			squargonlegs = {required=1, short="legs"},
	},
	yggdrasiltablet = {
			tabletstylus = {required=1, short="stylus"},
			tablettwine = {required=1, short="twine"},
			tabletwax = {required=1, short="wax"},
			tabletwood = {required=1, short="wood"},
	},		 
	valdblom = {
			valdblomessence = {required=2, short="essence"},
			valdblomleaves = {required=2, short="leaves"},
			valdblomroot = {required=2, short="root"},
			valdblomstem = {required=2, short="stem"},
	},		 
	earthshapingtome = {
			shapingtomeclay = {required=1, short="clay"},
			shapingtomeplates = {required=1, short="plates"},
			shapingtomgranite = {required=1, short="granite"},
			shapingtominsignia = {required=1, short="insignia"},
	},		 
	nexuscube = {
			nexuscubeglass = {required=1, short="glass"},
			nexuscubegold = {required=1, short="gold"},
			nexuscubemote = {required=1, short="mote"},
			nexuscubescript = {required=1, short="script"},
	},		 
	firecrystal = {
			firecrystalenchantment = {required=1, short="enchantment"},
			firecrystalflame = {required=1, short="flame"},
			firecrystalspark = {required=1, short="spark"},
			firecrystalstone = {required=1, short="stone"},
	},		 
	planarmote = {
			moteaura = {required=1, short="aura"},
			motebinding = {required=1, short="binding"},
			moteenchantment = {required=1, short="enchantment"},
			moteflame = {required=1, short="flame"},
	},		 
	goldensnakeskin = {
			goldencolouring = {required=1, short="colouring"},
			goldenenchantment = {required=1, short="enchantment"},
			goldenscales = {required=1, short="scales"},
			goldenskin = {required=1, short="skin"},
	},		 
	yggdrasilbranch = {
			yggdrasilbranchhook = {required=1, short="hook"},
			yggdrasilbranchline = {required=1, short="line"},
			yggdrasilbranchmosaic = {required=1, short="mosiac"},
			yggdrasilbranchwood = {required=1, short="wood"},
	},		 
	criersbell = {
			crierschime = {required=1, short="chime"},
			crierscurse = {required=1, short="curse"},
			criershandle = {required=1, short="handle"},
			criersshell = {required=1, short="shell"},
	},		 
-- Contenders
	contenderspig = {
			pigclay = {required=1, short="clay"},
			pigears = {required=1, short="ears"},
			pigbelly = {required=1, short="belly"},
			pigtail = {required=1, short="tail"},
	},	
	contendersjug = {
			juglip = {required=1, short="lip"},
			jugbase = {required=1, short="base"},
			jugbowl = {required=1, short="bowl"},
			jughandle = {required=1, short="handle"},
	},
	contendersbouquet = {
			bouquetstring = {required=1, short="string"},
			bouquetknot = {required=1, short="knot"},
			bouquetbloom = {required=1, short="bloom"},
			bouquetstem = {required=1, short="stem"},
	},
	contendersfigurine = {
			contenderfigurinehead = {required=1, short="head"},
			contenderfigurinearms = {required=1, short="arms"},
			contenderfigurinelegs = {required=1, short="legs"},
			contenderfigurinebody = {required=1, short="body"},
	},
	contendersglass = {
			glasshandle = {required=1, short="handle"},
			glasspane = {required=1, short="pane"},
			glassfocus = {required=1, short="focus"},
			glassframe = {required=1, short="frame"},
	},
	contendersjournal = {
			journalbinding = {required=1, short="binding"},
			journalpage = {required=1, short="page"},
			journalcover = {required=1, short="cover"},
			journalindex = {required=1, short="index"},
	},
	contendersstud = {
			studgleam = {required=1, short="gleam"},
			studpost = {required=1, short="post"},
			studgem = {required=1, short="gem"},
			studback = {required=1, short="back"},
	},
	contendersribbon = {
			ribbongilding = {required=1, short="gilding"},
			ribbonpin = {required=1, short="pin"},
			ribbonstripe = {required=1, short="stripe"},
			ribbonfold = {required=1, short="fold"},
	},
-- Underworld
	cryptworm = {
			cryptwormhead = {required=1, short="head"},
			cryptwormbody = {required=1, short="body"},
			cryptwormfangs = {required=1, short="fangs"},
			cryptwormbinding = {required=1, short="binding"},
	},
	psychesplinter = {
			psychesplinterchain = {required=1, short="chain"},
			psychesplinterframe = {required=1, short="frame"},
			psychesplinterlength = {required=1, short="length"},
			psychesplintercurse = {required=1, short="curse"},
	},
	sanityskein = {
			sanityskeinthread = {required=1, short="thread"},
			sanityskeincoil = {required=1, short="coil"},
			sanityskeincurse = {required=1, short="curse"},
			sanityskeinbinding = {required=1, short="binding"},
	},
	custodytalisman = {
			custodyleft = {required=1, short="left"},
			custodyright = {required=1, short="right"},
			custodycentre = {required=1, short="centre"},
			custodybinding = {required=1, short="binding"},
	},
	unlifetotem = {
			unlifetotembase = {required=1, short="base"},
			unlifetotemwood = {required=1, short="wood"},
			unlifetotemskull = {required=1, short="skull"},
			unlifetotemtendrils = {required=1, short="tendrils"},
	},
	soulsliver = {
			soulsliverobsidian = {required=1, short="obsidian"},
			soulsliverfog = {required=1, short="fog"},
			soulsliversouls = {required=1, short="souls"},
			soulslivercurse = {required=1, short="curse"},
	},
	cullingblade = {
			cullingbladehilt = {required=1, short="hilt"},
			cullingbladeedge = {required=1, short="edge"},
			cullingblademetal = {required=1, short="metal"},
			cullingbladecurse = {required=1, short="curse"},
	},
	funeralshroud = {
			funeralshroudcloth = {required=1, short="cloth"},
			funeralshroudthread = {required=1, short="thread"},
			funeralshroudbenediction = {required=1, short="benedict"},
			funeralshroudclasp = {required=1, short="clasp"},
	},
--Renegades
	mercenarychalk = {
			mercenarychalkbinding = {required=1, short="binding"},
			mercenarychalkchalk = {required=1, short="chalk"},
			mercenarychalkdust = {required=1, short="dust"},
			mercenarychalkstick = {required=1, short="stick"},
	},
	elementalinjunction = {
			injunctionpaper = {required=1, short="paper"},
			injunctionscript = {required=1, short="script"},
			injunctionseal = {required=1, short="seal"},
			injunctionsignature = {required=1, short="signature"},
	},
	moppet = {
			moppetbuttons = {required=1, short="buttons"},
			moppetcloth = {required=1, short="cloth"},
			moppeteyes = {required=1, short="eyes"},
			moppetthread = {required=1, short="thread"},
	},
	turncoatscoat = {
			turncoatscoatbinding = {required=1, short="binding"},
			turncoatscoatbuttons = {required=1, short="buttons"},
			turncoatscoatcloth = {required=1, short="cloth"},
			turncoatscoatthread = {required=1, short="thread"},
	},
	shadowcloak = {
			shadowcloakclasp = {required=1, short="clasp"},
			shadowcloakcloth = {required=1, short="cloth"},
			shadowcloakcurse = {required=1, short="curse"},
			shadowcloakthread = {required=1, short="thread"},
	},
	betrayersmantle = {
			betrayersmantlecloth = {required=1, short="cloth"},
			betrayersmantlecurse = {required=1, short="curse"},
			betrayersmantlestraps = {required=1, short="straps"},
			betrayersmantlethread = {required=1, short="thread"},
	},
	turncoatsmasque = {
			turncoatsmasquecurse = {required=1, short="curse"},
			turncoatsmasqueetchings = {required=1, short="etchings"},
			turncoatsmasqueeyes = {required=1, short="eyes"},
			turncoatsmasquestone = {required=1, short="stone"},
	},
	sunderedpennon = {
			sunderedpennonbinding = {required=1, short="binding"},
			sunderedpennoncloth = {required=1, short="cloth"},
			sunderedpennonstaff = {required=1, short="staff"},
			sunderedpennonthread= {required=1, short="thread"},
	},
--Invasion
	darkearthfigrine = {
			darkeartharms = {required=1, short="arms"},
			darkearthhead = {required=1, short="head"},
			darkearthlegs = {required=1, short="legs"},
			darkearthtorso = {required=1, short="torso"},
	},
	batteringram = {
			batteringrambolts = {required=1, short="bolts"},
			batteringramgrips = {required=1, short="grips"},
			batteringramram = {required=1, short="ram"},
			batteringramwheels = {required=1, short="wheels"},
	},
	caltrop = {
			caltropball = {required=1, short="ball"},
			caltropbarbs = {required=1, short="barbs"},
			caltropbinding = {required=1, short="binding"},
			caltropspikes = {required=1, short="spikes"},
	},
	cauldron = {
			cauldronbase = {required=1, short="base"},
			cauldronhandle = {required=1, short="handle"},
			cauldronoil = {required=1, short="oil"},
			cauldronpot = {required=1, short="pot"},
	},
	shadowshackle = {
			shadowshackleenchantment = {required=1, short="enchantment"},
			shadowshacklelink = {required=1, short="link"},
			shadowshacklemetal = {required=1, short="metal"},
			shadowshackleshadow = {required=1, short="shadow"},
	},
	hagseye = {
			hagseyeball = {required=1, short="ball"},
			hagseyeenchantment = {required=1, short="enchantment"},
			hagseyefluid = {required=1, short="fluid"},
			hagseyelid= {required=1, short="lid"},
	},
	icebrick = {
			icebinding = {required=1, short="binding"},
			iceenchantment = {required=1, short="enchantment"},
			magicice = {required=1, short="magic"},
			repeatingspell = {required=1, short="spell"},
	},
	scoutingmap = {
			scoutingmapenchantment = {required=1, short="enchantment"},
			scoutingmapicons = {required=1, short="icons"},
			scoutingmapink = {required=1, short="ink"},
			scoutingmapvellum = {required=1, short="vellum"},
	},
-- War
	rottingremains = {
			remainsbones = {required=1, short="bones"},
			remainsflesh = {required=1, short="flesh"},
			remainsmuscles = {required=1, short="muscles"},
			remainsblood = {required=1, short="blood"},
	},
	gildedbit = {
			bitgilding = {required=1, short="gilding"},
			bitbar = {required=1, short="bar"},
			bitchain = {required=1, short="chain"},
			bitpatterns = {required=1, short="patterns"},
	},
	pigeon = {
			pigeonhead = {required=1, short="head"},
			pigeonbody = {required=1, short="body"},
			pigeonlegs = {required=1, short="legs"},
			pigeonwings = {required=1, short="wings"},
	},
	warcloud = {
			warcloudfog = {required=1, short="fog"},
			warcloudstench = {required=1, short="stench"},
			warcloudcurse = {required=1, short="curse"},
			warcloudbinding = {required=1, short="binding"},
	},
	portalhoop = {
			portalhoopsteel = {required=1, short="steel"},
			portalhooplight = {required=1, short="light"},
			portalhoopenchantment = {required=1, short="enchantment"},
			portalhoopbinding = {required=1, short="binding"},
	},
	observantsigil = {
			observantsigilmetal = {required=1, short="metal"},
			observantsigilstar = {required=1, short="star"},
			observantsigileye = {required=1, short="eye"},
			observantsigillatice = {required=1, short="latice"},
	},

  cowculator = {
    cowculatorwood = {required=1, short="wood"},
    cowculatornumbers = {required=1, short="numbers"},
    cowculatorpaint = {required=1, short="paint"},
    cowculatorspectacles = {required=1, short="spectacles"},
  },
  golemgateway = {
    gatewayemblem = {required=1, short="emblem"},
    gatewaygates = {required=1, short="gates"},
    gatewayframe = {required=1, short="frame"},
    gatewaybars = {required=1, short="bars"},
  },
  brainjar = {
    brainjarpot = {required=1, short="pot"},
    brainjarbrains = {required=1, short="brains"},
    brainjarpreserves = {required=1, short="preserves"},
    brainjarlabel = {required=1, short="label"},
  },
  hollowbook = {
    hollowbookcovers = {required=1, short="covers"},
    hollowbookeye = {required=1, short="eye"},
    hollowbookglyphs = {required=1, short="glyphs"},
    hollowbookscream = {required=1, short="scream"},
  },
  faemirror = {
    faemirrorglass = {required=1, short="glass"},
    faemirrorcrystal = {required=1, short="crystal"},
    faemirrorhandle = {required=1, short="handle"},
    faemirrorscript = {required=1, short="script"},
  },
  celestialcoronet = {
    coronetband = {required=1, short="band"},
    coronetangels = {required=1, short="angels"},
    coronetspheres = {required=1, short="spheres"},
    coronetengravings = {required=1, short="engravings"},
  },
  chaosclaw = {
    chaosclawedge = {required=1, short="edge"},
    chaosclawtip = {required=1, short="tip"},
    chaosclawcorruption = {required=1, short="corruption"},
    chaosclawspan = {required=1, short="span"},
  },
  iconstatuette = {
    statuetteglobe = {required=1, short="globe"},
    statuettesigils = {required=1, short="sigil"},
    statuetteshards = {required=1, short="shard"},
    statuetteicon = {required=1, short="icon"},
  },
  kris = {
    krisblade = {required=1, short="blade"},
    krishaft = {required=1, short="haft"},
    krisrunes = {required=1, short="runes"},
    krissteel = {required=1, short="steel"},
  },
  crystalsword = {
    crystalswordhilt = {required=1, short="hilt"},
    crystalswordguard = {required=1, short="guard"},
    crystalswordblade = {required=1, short="blade"},
    crystalswordgem = {required=1, short="gem"},
  },

	gaia = {
    cherryblossomstem = {required=1, short="stem"},
    cherryblossomflower = {required=1, short="flower"},
    cherryblossomstamen = {required=1, short="stamen"},
    cherryblossomscent = {required=1, short="scent"},
  },
	lorielan = {
    filtercrystal = {required=1, short="crystal"},
    filterbronze = {required=1, short="bronze"},
    filterfitting = {required=1, short="fitting"},
    filterpolish = {required=1, short="polish"},
  },
	vulnurana = {
    sachetcloth = {required=1, short="cloth"},
    sachetherbs = {required=1, short="herbs"},
    sachetstring = {required=1, short="string"},
    sachetscent = {required=1, short="scent"},
  }, 
	twilight = {
    houndcarvingeyes = {required=1, short="eyes"},
    houndcarvinglegs = {required=1, short="legs"},
    houndcarvingfangs = {required=1, short="fangs"},
    houndcarvingobsidian = {required=1, short="obsidian"},
  },
	phaestus = {
    finishinghammerhead = {required=1, short="head"},
    finishinghammerrunes = {required=1, short="runes"},
    finishinghammerhandle = {required=1, short="handle"},
    finishinghammergrip = {required=1, short="grip"},
  },
	scarlatti = {
    citolestrings = {required=1, short="strings"},
    citolebody = {required=1, short="body"},
    citolebase = {required=1, short="base"},
    citoletune = {required=1, short="tune"},
  },
	prospero = {
    batteredpanhandle = {required=1, short="handle"},
    batteredpandish = {required=1, short="dish"},
    batteredpangrip = {required=1, short="grip"},
    batteredpanspell = {required=1, short="spell"},
  },
	aegis = {
    declarationpaper = {required=1, short="paper"},
    declarationtext = {required=1, short="text"},
    declarationsignature = {required=1, short="signature"},
    declarationseal = {required=1, short="seal"},
  },
	vastar = {
    vastarwingfeathers = {required=1, short="feathers"},
    vastarwingstraps = {required=1, short="straps"},
    vastarwingspan = {required=1, short="span"},
    vastarwinglightning = {required=1, short="lightning"},
  },
}

talisman.createlookup()
