if ak.ai() then return end
ak.deleteFull()
enableTrigger("Confirmed Hit Limbs")
if #ak.limbs.parriedlimbs>0 then
	table.remove(ak.limbs.parriedlimbs,1)
end
disableTrigger("Monk Parry")
ak.limbs.ScoreRun = false
ak.limbs.LimbHit(target, "Me", "spp", "rightarm", "none")
