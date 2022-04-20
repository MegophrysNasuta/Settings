disableTrigger("Finale Read Aura")
disableTrigger("Readaura Defs")
enableTrigger("Wsys Tattoos")
enableTrigger("Lifegiver (def)")
cecho("<yellow>[<white>"..ak.occie.aura.physical.."|<cyan>"..ak.occie.aura.mental.."<yellow>]")
ak.occie.aura.physical = matches[3] + 0
ak.occie.aura.mental = matches[4] + 0
ak.scoreup(matches[2])
if (not ak.defs.speed) then cecho("\n-- <red>-<white>SPEED<red>-<white>SPEED<red>") end
