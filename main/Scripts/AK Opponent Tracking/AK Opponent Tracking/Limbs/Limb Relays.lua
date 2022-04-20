--limb relays
function ak.limbs.damageEcho_Target(who,limb)       -----Reset Timer --ak.limbs.tekura.dontbreaksethead
  local hitsneeded = roundUp((100-ak.limbs.limbcount[who][limb])/(ak.limbs.limbcount[who][limb] - ak.limbs.limbcount[who]["lastpercent"..limb]),0)
--Limbs
  if (ak.limbs.limbcount[who][limb] >= 100) and limb ~= "torso" and limb ~= "head" then
		 ak.limbs.limbcount[who].maxbreaks[limb] = ak.limbs.limbcount[who][limb]
     ak.limbs.limbcount[who][limb] = 0
     affstrack.score[limb] = 200
		 ak.limbs.lastbroke = limb
     cecho("<green>\n\nBroke "..who.."'s "..limb.."(A)!!")
		 ak.limbs.breakOrder(limb)
--Head
  elseif (ak.limbs.limbcount[who][limb] >= 100) and not ak.limbs.tekura.dontbreaksethead then
		 ak.limbs.limbcount[who].maxbreaks[limb] = ak.limbs.limbcount[who][limb]
     ak.limbs.limbcount[who][limb] = 0
     affstrack.score[limb] = affstrack.score[limb] + 100
     if limb == "head" then affstrack.score.stupidity = 100 end
		 ak.limbs.lastbroke = limb
     cecho("<green>\n\nBroke "..who.."'s "..limb.."(B)!!")
		 ak.limbs.breakOrder(limb)
  elseif ak.limbs.tekura.dontbreaksethead then
     if ak.limbs.limbcount[who]["head"] > 100 then
        affstrack.score["head"] = 200
        affstrack.score.stupidity = 100
     else
        ak.limbs.limbcount[who]["head"] = ak.limbs.limbcount[who]["lastpercenthead"]
        affstrack.score["head"] = affstrack.score["head"] + 100
        affstrack.score.stupidity = 100
     end
		 ak.limbs.lastbroke = limb
     cecho("<green>\n\nBroke "..who.."'s "..limb.."(AXK)!!")
		 ak.limbs.breakOrder(limb)
  end
  if affstrack.score.head > 200 then affstrack.score.head = 200 end
  cecho("<yellow>\n"..who.."'s "..limb.." is at<cyan> "..roundUp(ak.limbs.limbcount[who][limb],0).."("..hitsneeded..")!!")
  if ak.limbs.ScoreRun then 
		ak.scoreup(target)
		--cecho("<green>Score!")
  end
  limbtimer = limbtimer or {}
  limbtimer[who] = limbtimer[who] or {}
  if limbtimer[who][limb] then killTimer(limbtimer[who][limb]) end
  if who == "Me" and limb == "torso" then
     limbtimer[who][limb] = tempTimer(180, [[ 
         ak.limbs.ignoretorso = false
         cecho("<yellow>\n\nReset ]]..who..[['s ]]..limb..[[!\n")
         ak.limbs.limbcount.]]..who..[[.]]..limb..[[ = 0
         ak.scoreup(target)
     ]])
  else
     limbtimer[who][limb] = tempTimer(180, [[ 
         cecho("<yellow>\n\nReset ]]..who..[['s ]]..limb..[[!\n")
         ak.limbs.limbcount.]]..who..[[.]]..limb..[[ = 0
         ak.scoreup(target)
     ]])
  end
end

function ak.limbs.damageEcho_Non_Target(who,limb) 
  donotrebreak = donotrebreak or {}
  donotrebreak[who] = donotrebreak[who] or {}
  limbtimer = limbtimer or {}
  limbtimer[who] = limbtimer[who] or {}
  local hitsneeded = roundUp((100-ak.limbs.limbcount[who][limb]) / (ak.limbs.limbcount[who][limb] - ak.limbs.limbcount[who]["lastpercent"..limb]),0)
  --local hitsneeded = roundUp(100 / (ak.limbs.limbcount[who][limb] - ak.limbs.limbcount[who]["lastpercent"..limb]),0)
--Limbs
  if ak.limbs.limbcount[who][limb] >= 100 and limb ~= "torso" and limb ~= "head" then
     ak.limbs.limbcount[who][limb] = 0
     if who == "Me" or who == "You" then 
        cecho("<green>\n\nBroke my "..limb.."!!")			
		else
        cecho("<green>\n\nBroke "..who.."'s "..limb.."!!")
     end
     ak.limbs.damagedisable(who,limb)
--Head
  elseif ak.limbs.limbcount[who][limb] >= 100 then
     ak.limbs.limbcount[who][limb] = 0
     if who == "Me" or who == "You" then 
        cecho("<green>\n\nBroke my "..limb.."!!")			
		else
        cecho("<green>\n\nBroke "..who.."'s "..limb.."!!")
     end
     if (who == "Me" or who == "You") and limb == "torso" and not ak.limbs.ignoretorso then
        wsys.affadd("mildtrauma")
				send("curing predict mildtrauma")
     end
     ak.limbs.damagedisable(who,limb)
  end
  if who == "Me" then
     if GUI and GUI.UpdateLimbs then GUI.UpdateLimbs() end
     cecho("<yellow>\nMy <cyan>"..limb.." is at<cyan> "..roundUp(ak.limbs.limbcount[who][limb],0).."("..hitsneeded..")!!")
     if ak.limbs.ScoreRun then ak.scoreup(target) end
     if limbtimer[who][limb] then 
			killTimer(limbtimer[who][limb]) 
		end
     limbtimer[who][limb] = tempTimer(180, [[ 
         cecho("<yellow>\n\nReset My ]]..limb..[[!\n")
         ak.limbs.limbcount.]]..who..[[.]]..limb..[[ = 0
         if GUI and GUI.UpdateLimbs then GUI.UpdateLimbs() end
         ak.scoreup(target)
     ]])
  else
     if limbtimer[who][limb] then 
			killTimer(limbtimer[who][limb]) 
		end
     limbtimer[who][limb] = tempTimer(180, [[ 
         cecho("<yellow>\n\nReset ]]..who..[['s ]]..limb..[[!\n")
         ak.limbs.limbcount.]]..who..[[.]]..limb..[[ = 0
         if ]]..who..[[ == target then ak.scoreup(target)end
     ]])
  end
end

function ak.limbs.damagedisable(who,limb)
   if limb == "aflame" or who == "Me" then
      return
   elseif _G[who..""..limb.."disablelimbdamage"] == nil then 
      _G[who..""..limb.."disablelimbdamage"] = tempTimer(4,[[
         _G["]]..who..[[]]..limb..[[disablelimbdamage"] = nil
         cecho("<cyan>\n\n\nCounting again for, <yellow>]]..who..[['s ]]..limb..[[!\n\n\n")
         ak.limbs.countAgain("]]..who..[[","]]..limb..[[")
         cecho("<cyan>\n\n\nCounting again for, <yellow>]]..who..[['s ]]..limb..[[!\n\n\n")
      ]])
   end
end

function ak.limbs.countAgain(who,limb) --Return From Timeout on Secondary Targets
   local remove = limb:gsub("%s+", "")
   remove = remove:lower()
end

function ak.limbs.CountAgain(limb) --Return from Apply Script
   ak.limbs.limb_table_check(target)
   if ak.limbs.limbcount[target] and ak.limbs.limbcount[target][limb] then 
      ak.limbs.limbcount[target][limb] = 0 
   end
end

