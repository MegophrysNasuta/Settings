
NoMiddle = NoMiddle or {}

function ak.MonkType()
  if gmcp.Char.Vitals and gmcp.Char.Vitals.charstats[4] and string.find(gmcp.Char.Vitals.charstats[4], "Form")
  then
    return "Shikudo"
  else
    return "Tekura"
  end
end

function ak.KillTriggers()
	disableKey("Shaman Keys")
	disableKey("Dragon Keys")
	disableTrigger("Air Lord Group")
	disableTrigger("Water Lord Group")
	disableTrigger("Monk Group")
	disableTrigger("Sentinel Group")
	disableTrigger("Depthswalker Group")
	disableTrigger("Runewarden Group")
	disableTrigger("2h Group")
	disableTrigger("Targossas Group")
	disableTrigger("Totem Group")
	disableTrigger("Serpent Group")
	disableTrigger("Jester Group")
	disableTrigger("Tarot Group")
	disableTrigger("Magi Group")
	disableTrigger("Psion Group")
	disableTrigger("Apostate Group")
	disableTrigger("Shaman Group")
	disableTrigger("Dragon Group")
	disableTrigger("Sword & Board Group")
	disableTrigger("Bard Group")
	disableTrigger("Blademaster Group")
  disableTrigger("Fire Lord Group")
	disableTrigger("Occultist Group")
	disableTrigger("Sylvan Group")
	disableTrigger("Alchemist Group")
  disableTrigger("Targossas Group")
  disableTrigger("Priest Group")
end

function ak.classenable()
  if ak.CustomGuiEnable then
    ak.CustomGuiEnable()
  end
  if ak.morphingCheck then
    ak.morphingCheck()
  end
  ak.defaultstack()
  if gmcp.Char.Status.race:match("Dragon") or gmcp.Char.Status.class ~= "Shaman" then
    swiftcount = 0
  end
  if gmcp.Char.Status.race:match("Dragon") then
    ak.KillTriggers()
    enableTrigger("Dragon Group")
		if not table.contains(ak.MovementKeys, gmcp.Char.Name.name) then enableKey("Dragon Keys") end
    cecho("<yellow>\n\nDRAGON ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Monk" then
    ak.KillTriggers()
    enableTrigger("Monk Group")
    cecho("<yellow>\n\nMONK ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Priest" then
    ak.KillTriggers()
    enableTrigger("Targossas Group")
    enableTrigger("Priest Group")
    cecho("<yellow>\n\nPRIEST ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Magi" then
    ak.KillTriggers()
    enableTrigger("Magi Group")
    cecho("<yellow>\n\nMAGI ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Sylvan" then
    ak.KillTriggers()
    enableTrigger("Sylvan Group")
    cecho("<yellow>\n\nSYLVAN ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Shaman" then
		ak.KillTriggers()
    enableKey("Shaman Keys")
    enableTrigger("Shaman Group")
    cecho("<yellow>\n\nSHAMAN ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Serpent" then
    ak.KillTriggers()
    enableTrigger("Serpent Group")
    cecho("<yellow>\n\nSERPENT ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Jester" then
    ak.KillTriggers()
    enableTrigger("Tarot Group")
    enableTrigger("Jester Group")
    cecho("<yellow>\n\nJESTER\n\n")
  elseif gmcp.Char.Status.class == "Alchemist" then
    ak.KillTriggers()
		enableTrigger("Alchemist Group")
    cecho("<yellow>\n\nALCHEMIST\n\n")
  elseif gmcp.Char.Status.class == "Infernal" or gmcp.Char.Status.class == "Paladin" or gmcp.Char.Status.class == "Runewarden" then
    ak.KillTriggers()
		if gmcp.Char.Status.class == "Paladin" then
      enableTrigger("Targossas Group")
    elseif gmcp.Char.Status.class == "Runewarden" then
      enableTrigger("Runewarden Group")
    end
    enableTrigger("Totem Group")
    enableTrigger("2h Group")
    enableTrigger("Sword & Board Group")
    cecho("<yellow>\n\nKNIGHT ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Sentinel" then
    ak.KillTriggers()
    enableTrigger("Sentinel Group")
    cecho("<yellow>\n\nSENTINEL ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Occultist" then
    ak.KillTriggers()
    enableTrigger("Tarot Group")
    enableTrigger("Occultist Group")
    cecho("<yellow>\n\nOCCULTIST ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Bard" then
    ak.KillTriggers()
    enableTrigger("Bard Group")
    cecho("<yellow>\n\nBARD ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Depthswalker" then
    ak.KillTriggers()
    enableTrigger("Depthswalker Group")
    cecho("<yellow>\n\nDEPTHSWALKER ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Apostate" then
    ak.KillTriggers()
    enableTrigger("Apostate Group")
    cecho("<yellow>\n\nABOSTATE ENABLED\n\n")
  elseif gmcp.Char.Status.class == "water Elemental Lord" then
	  ak.KillTriggers()
    enableTrigger("Water Lord Group")
    cecho("<yellow>\n\nWATER ELEMENTAL ENABLED\n\n")
  elseif gmcp.Char.Status.class == "air Elemental Lord" then
    ak.KillTriggers()
    enableTrigger("Air Lord Group")
    cecho("<yellow>\n\nAIR ELEMENTAL ENABLED\n\n")
	elseif gmcp.Char.Status.class == "fire Elemental Lord" then
    ak.KillTriggers()
    enableTrigger("Fire Lord Group")
    cecho("<yellow>\n\nFire ELEMENTAL ENABLED\n\n")
  elseif gmcp.Char.Status.class == "Blademaster" then
    ak.KillTriggers()
    enableTrigger("Blademaster Group")
    cecho("<yellow>\n\nBLADEMASTER ENABLED\n\n")
	elseif gmcp.Char.Status.class == "Psion" then
    ak.KillTriggers()
		enableTrigger("Psion Group")
		enableKey("Psion Keys")
    cecho("<yellow>\n\nPsion ENABLED\n\n")
  end
  ak.scoreup(target)
end
