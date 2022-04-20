function ak.skullHit()
  if isActive("AK_SkullTimer","timer") == 0 and ak.twoh.skull > 0 then
		ak.skullcount = 0
		OppGainedAff("nausea")
		enableTimer("AK_SkullTimer")
	elseif ak.twoh.skull == 0 then
		ak.skullcount = 0
		disableTimer("AK_SkullTimer")
	end
end

function ak.tendonHit()
	if isActive("AK_TendonTimer","timer") == 0 and ak.twoh.tendons > 0 then
		ak.tendonscount = 0
		OppGainedAff("clumsiness")
		enableTimer("AK_TendonTimer")
	elseif ak.twoh.tendons == 0 then
		ak.tendonscount = 0
		disableTimer("AK_TendonTimer")
	end
end

function ak.ribHit()
	if isActive("AK_RibsTimer","timer") == 0 and ak.twoh.ribs > 0 then
		ak.ribscount = 0
		OppGainedAff("prefarar")
		enableTimer("AK_RibsTimer")
	elseif ak.twoh.ribs == 0 then
		ak.ribscount = 0
		disableTimer("AK_RibsTimer")
	end
end

function ak.wristHit()
	if ak.twoh.wrist < 1 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
	elseif ak.twoh.wrist == 1 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
		ak.wristTimer = tempTimer(5, [[ak.wristTick()]])
	elseif ak.twoh.wrist == 2 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
		ak.wristTimer = tempTimer(4, [[ak.wristTick()]])
	elseif ak.twoh.wrist == 3 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
		ak.wristTimer = tempTimer(3, [[ak.wristTick()]])
	elseif ak.twoh.wrist == 4 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
		ak.wristTimer = tempTimer(2, [[ak.wristTick()]])
	elseif ak.twoh.wrist >= 5 then
		if ak.wristTimer then killTimer(ak.wristTimer) end
		ak.wristTimer = tempTimer(1, [[ak.wristTick()]])
	end 
end

function ak.wristTick()
	ak.wristHit()
end


