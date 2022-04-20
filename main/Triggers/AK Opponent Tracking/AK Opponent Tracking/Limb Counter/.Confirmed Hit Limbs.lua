if ak.ai() then
	ak.limbs.currentbreak.weapon = {}
	ak.limbs.currentbreak.limb = {}
	ak.limbs.currentbreak.attacker = {}
	ak.limbs.currentbreak.who = {}
	ak.limbs.currentbreak.augment = {}
	ak.limbs.absorbed = false
	disableTrigger("Missed Single Removal Limbs")                --DO NOT CHANGE!
  disableTrigger("Parry locate")
  disableTrigger("Monk Parry")
elseif isPrompt() then
	ak.limbs.parseBreaksPrompt()
else
	if not ak.limbs.deleteset then
		--deleteLine() --THIS ISNT EVEN PROMPT WHY DELETE IT?
		--ak.showPrompt()
	end
	ak.limbs.parseBreaks()
end



