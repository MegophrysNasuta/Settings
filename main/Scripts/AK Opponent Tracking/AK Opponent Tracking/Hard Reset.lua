--scoreup2
function ak.oresetparse()
target = target or "Austere"
ak.dragonTarget = false
ak.elementalTarget = false
ak.stack = ak.stack or "none"
affstrack.impale = false
targetparry = "unknown"
ak.bleeding = 0
ak.flyer = false
mycharacters = mycharacters or {}--This is for my Personal Gui
if swiftcount == nil then swiftcount = 0 end
disableTimer("Hypochondria Timer")
opponenteat = 0
promptset = {}
applycure = {}
ak.bals.salve = true
ak.bals.focus = true
opponenttree = 0

ak.defs.mass = true
ak.defs.shield = false
ak.defs.rebounding = true
ak.defs.reRebounding = false
ak.defs.sileris = true
ak.defs.curseward = true
ak.defs.holdbreath = false
ak.defs.speed = true

timerherb = 0
if ak.timers.apply then
	killTimer(ak.timers.apply)
	ak.timers.apply = false
end
if ak.timers.salvebackup then 
	killTimer(ak.timers.salvebackup) 
end
opponenthalftree = 0
timertree = 0
currentvenoms = {}
lastvenom = {}
targetlyred = 0
boilable = true
vodun = vodun or {}
lockcheck = false
ak.tza = false
knownrun = nil
parsedclasscures = false
ak.psion.unweaving.mind = 0
ak.psion.unweaving.body = 0
ak.psion.unweaving.spirit = 0
ak.resetbacktrack()
ak.twoh = ak.twoh or {}
ak.twoh.skull = 0
ak.twoh.ribs = 0
ak.twoh.tendons = 0
ak.twoh.wrist = 0
ak.occie.aura.physical =  0
ak.occie.aura.mental = 0
ak.alchemist.humour.sanguine = 0
ak.alchemist.humour.choleric = 0
ak.alchemist.humour.melancholic = 0
ak.alchemist.humour.phlegmatic = 0
ak.pervasion.initialbleed = false
ak.pervasion.hitcount = 0
ak.shaman.Relapseaff = "none"
ak.shaman.coagulation = true
ak.shaman.bloodlet = true
ak.shaman.relapse = true
ak.shaman.GetFashions = false
ak.psion.transcend = 0
ak.jinxcount = 0
if ak.scaldTimer then killTimer(ak.scaldTimer) end
if ak.tendonTimer then killTimer(ak.tendonTimer) end
if ak.skullTimer then killTimer(ak.skullTimer) end
if ak.wristTimer then killTimer(ak.wristTimer) end
if ak.ribTimer then killTimer(ak.ribTimer) end
ak.track.flown = false
ak.diagnosingoffbal = false
ak.CustomCureSend = false
ak.manapercent = 100
ak.healthpercent = 100
ak.currentmana = 5000
ak.maxmana = 5000
ak.currenthealth = 5000
ak.maxhealth = 5000
ak.engaged = false
ak.TorsoWrench = false
ak.HeadWrenchDisable = nil
ak.InitialWrench = nil
ak.propped = false
ak.SerpentRotateBite = false
ak.duress.pressure = 0
ak.duress.scourrelapse = false
ak.duress.stranglerelapse = false
ak.duress.zephyrrelapse = false
ak.duress.asphyxiate = false
ak.tumbling = false
for k,v in pairs(affstrack.score) do
   affstrack.score[k] = 0
end
affstrack.enlightenscore = 0
affstrack.ginsengscore = 0
affstrack.goldenscore = 0
affstrack.pyradiusscore = 0
affstrack.kelpscore = 0
affstrack.tramplescore = 0
affstrack.mentalscore = 0
affstrack.totalaffs = 0
ak.randomaffs = 0
ak.knownmaxhealth = ak.knownmaxhealth or {}
ak.limbs.limb_table_check(target)
if gmcp and ak.stack == "none" then
   ak.classenable()
end
ak.scoreup(target)
if gmcp and gmcp.Char and gmcp.Char.Vitals and gmcp.Char.Vitals.maxhp then
   ak.knownmaxhealth["Me"] = tonumber(gmcp.Char.Vitals.maxhp) or 5150
   ak.classlockadd()
   if not ak.displaydecide then 
      ak.classenable()
      if ak.nodisplay == false and not table.contains(mycharacters,gmcp.Char.Name.name) then 
         init() 
      end 
      ak.displaydecide = true 
   end
end
if ak.radiancestack then
   ak.stack = ak.radiancestack
   ak.radiancestack = nil
end
cecho("<cyan> Reset Success!\n\n")
end
