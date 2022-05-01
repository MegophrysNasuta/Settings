function ak.softreset()
  ak.tza = false
	ak.shaman.Relapseaff = "none"
  ak.shaman.coagulation = true
  ak.shaman.bloodlet = true
	ak.shaman.GetFashions = false
	ak.pervasion.hitcount = 0
	ak.pervasion.initialbleed = false
	ak.bleeding = 0
  ak.shaman.relapse = true
	cecho("<cyan> \nINITATED A SOFT OPPONENT AFFLICTON RESET, DID NOT RESET ANY BALANCES!!")
	cecho("<yellow> \nINITATED A SOFT OPPONENT AFFLICTON RESET, DID NOT RESET ANY BALANCES!!")
	cecho("<cyan> \nINITATED A SOFT OPPONENT AFFLICTON RESET, DID NOT RESET ANY BALANCES!!")
	cecho("<yellow> \nINITATED A SOFT OPPONENT AFFLICTON RESET, DID NOT RESET ANY BALANCES!!\n\n")
	disableTrigger("Swiftstring")
	disableTimer("Hypochondria Timer")
	ak.resetbacktrack()
	targetlyred = 0
	applycure = {}
	ak.bals.salve = true
	ak.bals.focus = true
	if ak.tendonTimer then killTimer(ak.tendonTimer) end
	if ak.skullTimer then killTimer(ak.skullTimer) end
	if ak.wristTimer then killTimer(ak.wristTimer) end
	if ak.ribTimer then killTimer(ak.ribTimer) end
	if ak.timers.salvebackup then killTimer(ak.timers.salvebackup) end
	local wasdehydrated = false
	local wastimefluxed = false
	local hieroup = false
	local rixilup = false
	if affstrack and affstrack.score then
   	if affstrack.score.dehydrate == 100 then
  	    wasdehydrated = true
  	 end
  	 if affstrack.score.timeflux == 100 then
  	    wastimefluxed = true
  	 end
	end	
	if affstrack.score.hierophant == 100 then
		hieroup = true
	end
	if affstrack.score.rixil == 100 then
		rixilup = true
	end
	ak.engaged = false

   for k,v in pairs(affstrack.score) do
      affstrack.score[k] = 0
   end

	if hieroup then 
		affstrack.score.hierophant = 100
	end
	if rixilup then 
		affstrack.score.rixil = 100
	end
	affstrack.enlightenscore = 0
	affstrack.ginsengscore = 0
	affstrack.goldenscore = 0
	affstrack.pyradiusscore = 0
	affstrack.kelpscore = 0
	affstrack.tramplescore = 0
	affstrack.mentalscore = 0
	affstrack.totalaffs = 0
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
	ak.randomaffs = 0
	opponenthalftree = 0
	if wasdehydrated then
	   affstrack.score.dehydrate = 100
	end
	if wastimefluxed then
	   affstrack.score.timeflux = 100
	end
	ak.track.flown = false
	ak.currentmana = 5000
	ak.maxmana = 5000
	ak.currenthealth = 5000
	ak.maxhealth = 5000
	ak.manapercent = 100
	ak.healthpercent = 100
	ak.classlockadd()
  if ak.radiancestack then
    ak.stack = ak.radiancestack
    ak.radiancestack = nil
  end
	ak.alchemist.humour.sanguine = 0
	ak.alchemist.humour.choleric = 0
	ak.alchemist.humour.phlegmatic = 0
	ak.alchemist.humour.melancholic = 0
  ak.scoreup(target)
end
