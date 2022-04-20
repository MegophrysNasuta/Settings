if ak.ai() then return end
if IsTargetted(matches[2]) then
	ak.alchemist.humour.sanguine = ak.alchemist.humour.sanguine - 1
	ak.alchemist.humour.choleric = ak.alchemist.humour.choleric - 1
	ak.alchemist.humour.melancholic = ak.alchemist.humour.melancholic - 1
	ak.alchemist.humour.phlegmatic = ak.alchemist.humour.phlegmatic - 1
end
if ak.alchemist.humour.sanguine < 0 then 
	ak.alchemist.humour.sanguine = 0
end
if ak.alchemist.humour.choleric < 0 then 
	ak.alchemist.humour.choleric = 0
end 
if ak.alchemist.humour.melancholic < 0 then 
	ak.alchemist.humour.melancholic = 0
end
if ak.alchemist.humour.phlegmatic < 0 then 
	ak.alchemist.humour.phlegmatic = 0
end
ak.scoreup(matches[2])
