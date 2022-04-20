if table.contains(tableofhits, "hit1") then
  if venom1 then
		if venom1 == "epteth" then
			if tarAff("lepteth") then
				Tragedy.TrackerAdd("repteth")
			else
				Tragedy.TrackerAdd("lepteth")
			end
		else
			Tragedy.TrackerAdd(venom1)
		end
	end
	if target.lastlimb then
		target.limbs[target.lastlimb] = target.limbs[target.lastlimb] + 1
	end
end
if table.contains(tableofhits, "hit2") then
  if venom2 then
		if venom2 == "epteth" then
			if tarAff("lepteth") then
				Tragedy.TrackerAdd("repteth")
			else
				Tragedy.TrackerAdd("lepteth")
			end
		else
			Tragedy.TrackerAdd(venom2)
		end
	end
	--[[if target.lastlimb then
		target.limbs[target.lastlimb] = target.limbs[target.lastlimb] + 1	
	end]]--
end
--[[if target.martellato then
	noshowAdd("prone")
end
if target.pesante then
	noshowAdd("undeaf")
end
if target.lastlimb then
	cecho("<green>test: "..target.limbs[target.lastlimb])
end]]--
Tragedy.hits = {}
venom1 = nil
venom2 = nil
--target.lastlimb = nil
illusion = false
--target.martellato = false
--target.pesante = false
