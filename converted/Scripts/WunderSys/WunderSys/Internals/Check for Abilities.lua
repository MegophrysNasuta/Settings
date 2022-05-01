function wsys.abilityCheck()
  wsys.abilitycheck = true
  sendGMCP([[Char.Skills.Get { "group": "survival", "name": "focusing" }]])
  sendGMCP([[Char.Skills.Get { "group": "survival", "name": "efficiency" }]])
  sendGMCP([[Char.Skills.Get { "group": "survival", "name": "insomnia" }]])
  sendGMCP([[Char.Skills.Get { "group": "survival", "name": "breathing" }]])
  sendGMCP([[Char.Skills.Get { "group": "chivalry", "name": "rage" }]])

  sendGMCP([[Char.Skills.Get { "group": "vision", "name": "deathsight" }]])
  sendGMCP([[Char.Skills.Get { "group": "necromancy", "name": "deathsight" }]])

  sendGMCP([[Char.Skills.Get { "group": "survival", "name": "clotting" }]])
  sendGMCP([[Char.Skills.Get { "group": "chivalry", "name": "clotting" }]])
  sendGMCP([[Char.Skills.Get { "group": "kaido", "name": "clotting" }]])

  sendGMCP([[Char.Skills.Get { "group": "venom", "name": "shrugging" }]])

  sendGMCP([[Char.Skills.Get { "group": "weaponry", "name": "parrying" }]])
  sendGMCP([[Char.Skills.Get { "group": "tekura", "name": "guarding" }]])
  sendGMCP([[Char.Skills.Get { "group": "swashbuckling", "name": "trueparry" }]])

  sendGMCP([[Char.Skills.Get { "group": "elementalism", "name": "simultaneity" }]])
  sendGMCP([[Char.Skills.Get { "group": "healing", "name": "simultaneity" }]])
  
  sendGMCP([[Char.Skills.Get { "group": "devotion", "name": "bliss" }]])
end


function wsys.abilityCheckAnalyse()
  if gmcp.Char.Skills.Info.skill == "clotting" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveclot = true
      --wsys.report("You have the clotting ability")
    end
  

  elseif gmcp.Char.Skills.Info.skill == "focusing" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.havefocus = true
      --wsys.report("You have the focussing ability")
    end

  elseif gmcp.Char.Skills.Info.skill == "breathing" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.havebreathing = true
      --wsys.report("You have the focussing ability")
    end
  

  elseif gmcp.Char.Skills.Info.skill == "insomnia" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveinsomnia = true
      --wsys.report("You have the insomnia ability")
    end
  

  elseif gmcp.Char.Skills.Info.skill == "rage" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haverage = true
      --wsys.report("You have the rage ability")
    end
  

  elseif gmcp.Char.Skills.Info.skill == "efficiency" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.treebaltime = 20 -- Actually 15 usually, but this is just a failsafe anyway
    else
      wsys.settings.treebaltime = 30
    end

  elseif gmcp.Char.Skills.Info.skill == "shrugging" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveshrugging = true
      --wsys.report("You have the shrugging ability")
    end

  elseif gmcp.Char.Skills.Info.skill == "parrying" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveparry = true
      --wsys.report("You have the parrying ability")
    end
  elseif gmcp.Char.Skills.Info.skill == "guarding" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveparry = true
      --wsys.report("You have the guarding ability")
    end
  elseif gmcp.Char.Skills.Info.skill == "trueparry" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.haveparry = true
      --wsys.report("You have the trueparrying ability")
    end

  elseif gmcp.Char.Skills.Info.skill == "simultaneity" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.havesimultaneity = true
      --wsys.report("You have the simultaneity ability")
    end

  elseif gmcp.Char.Skills.Info.skill == "bliss" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.havebliss = true
      --wsys.report("You have the simultaneity ability")
    end

  elseif gmcp.Char.Skills.Info.skill == "deathsight" then
    if not string.findPattern(gmcp.Char.Skills.Info.info, "You have not yet learned this ability") and gmcp.Char.Skills.Info.info ~= "" then
      wsys.settings.havedeathsight = true
    end

  end
  if wsys.abilitycheck and not wsys.curingstatuscheck then
    wsys.curingstatuscheck = true
    wsys.abilitycheck = false
    enableTrigger("Curing Status Check")
    send("curing status", false)
  end
  
end

registerAnonymousEventHandler("gmcp.Char.Skills.Info", "wsys.abilityCheckAnalyse")
