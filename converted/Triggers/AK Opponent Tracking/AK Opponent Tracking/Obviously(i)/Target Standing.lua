if ak.ai() then return end
if IsTargetted(matches[2]) then
	 ak.limbs.limb_table_check(matches[2])
   affstrack.score.prone = 0
	 if applycure.lastapplied and applycure.lastapplied == "legs" then
      AKcalculateSalve()
	 end
	 if ocured and ocured.bloodroot and ocured.bloodroot.paralysis and ocured.bloodroot.slickness and ak.ProTrackingConfirmed then
	 	ak.ProTrackingConfirmed("slickness")	
	 end
	 affstrack.score.paralysis = 0
   --if affstrack.score.rightleg>0 and affstrack.score.rightleg<100 then
   --   if ak.thoughtIhad then ak.thoughtIhad("rightleg") else affstrack.score.rightleg = 0 end 
   --   --ak.limbs.limbcount[target].rightleg = (ak.limbs.limbcount[target].lastpercentrightleg)
   --   _G[target.."rightlegdisablelimbdamage"] = nil
   --   --ak.limbs.limbcount[target].leftleg = (ak.limbs.limbcount[target].lastpercentleftleg)
   --   _G[target.."leftlegdisablelimbdamage"] = nil
   --   affstrack.score.leftleg = 0
   --elseif affstrack.score.leftleg>0 and affstrack.score.leftleg<100 then
   --   if ak.thoughtIhad then ak.thoughtIhad("leftleg") else affstrack.score.leftleg = 0 end
   --   --ak.limbs.limbcount[target].leftleg = (ak.limbs.limbcount[target].lastpercentleftleg)
   --   _G[target.."leftlegdisablelimbdamage"] = nil
   --   --ak.limbs.limbcount[target].rightleg = (ak.limbs.limbcount[target].lastpercentrightleg)
   --   _G[target.."rightlegdisablelimbdamage"] = nil
   --   affstrack.score.rightleg = 0
   --else
      if applycure and applycure.possiblemendings and #applycure.possiblemendings == 1 and applycure.possiblemendings[1] == "leftleg" then
         AKcalculateSalve()
         if affstrack.score.rightleg >= 100 then
            ak.limbs.limbcount[target].rightleg = ak.limbs.limbcount[target].lastpercentrightleg
            cecho("\n\n<cyan>"..target.."'s <yellow>Right Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
            _G[target.."rightlegdisablelimbdamage"] = nil
            if ak.thoughtIhad then ak.thoughtIhad("rightleg") else affstrack.score.rightleg = 0 end
         end
      elseif applycure and applycure.possiblemendings and #applycure.possiblemendings == 1 and applycure.possiblemendings[1] == "rightleg" then
         AKcalculateSalve()
         if affstrack.score.leftleg >= 100 then
            ak.limbs.limbcount[target].leftleg = ak.limbs.limbcount[target].lastpercentleftleg
            cecho("\n\n<cyan>"..target.."'s <yellow>Left Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
            _G[target.."leftlegdisablelimbdamage"] = nil
            if ak.thoughtIhad then ak.thoughtIhad("leftleg") else affstrack.score.leftleg = 0 end
         end
      else
				if ak.limbs.limbcount[target].maxbreaks.rightleg < ak.limbs.limbcount[target].maxbreaks.leftleg and affstrack.score.leftleg >= 100 and affstrack.score.rightleg >= 100 then
					ak.limbs.limbcount[target].leftleg = ak.limbs.limbcount[target].lastpercentleftleg
					cecho("\n\n<cyan>"..target.."'s <yellow>Left Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
					_G[target.."leftlegdisablelimbdamage"] = nil
					if ak.thoughtIhad then ak.thoughtIhad("leftleg") else affstrack.score.leftleg = 0 end				
				elseif ak.limbs.limbcount[target].maxbreaks.rightleg > ak.limbs.limbcount[target].maxbreaks.leftleg and affstrack.score.rightleg >= 100 and affstrack.score.leftleg >= 100 then
					ak.limbs.limbcount[target].rightleg = ak.limbs.limbcount[target].lastpercentrightleg
					cecho("\n\n<cyan>"..target.."'s <yellow>Right Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
					_G[target.."rightlegdisablelimbdamage"] = nil
					if ak.thoughtIhad then ak.thoughtIhad("rightleg") else affstrack.score.rightleg = 0 end
				else
					if ak.limbs.FindLastBrokenLeg() == "leftleg" and affstrack.score.leftleg > 100 then
         	   ak.limbs.limbcount[target].leftleg = ak.limbs.limbcount[target].lastpercentleftleg
         	   cecho("\n\n<cyan>"..target.."'s <yellow>Left Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
         	   _G[target.."leftlegdisablelimbdamage"] = nil
         	   if ak.thoughtIhad then ak.thoughtIhad("leftleg") else affstrack.score.leftleg = 0 end
					elseif affstrack.score.rightleg > 100 then
         	   ak.limbs.limbcount[target].rightleg = ak.limbs.limbcount[target].lastpercentrightleg
         	   cecho("\n\n<cyan>"..target.."'s <yellow>Right Leg <cyan>Count Is Off! Attempting To Correct!\n\n")
         	   _G[target.."rightlegdisablelimbdamage"] = nil
         	   if ak.thoughtIhad then ak.thoughtIhad("rightleg") else affstrack.score.rightleg = 0 end
					end
				end
      end
   --end
   affstrack.score.leftleg = 0
   affstrack.score.rightleg = 0
   ak.scoreup(matches[2])
   cecho("<cyan>\n\n"..target.. " IS NO LONGER PRONE.  HE|SHE IS UP!!\n\n")
   cecho("<cyan>"..target.. " IS NO LONGER PRONE.  HE|SHE IS UP!!\n\n")
   cecho("<cyan>"..target.. " IS NO LONGER PRONE.  HE|SHE IS UP!!\n\n")
   cecho("<cyan>"..target.. " IS NO LONGER PRONE.  HE|SHE IS UP!!\n\n")
   if ak.limbs.limbcount[matches[2]] then
      _G[target.."rightlegdisablelimbdamage"] = nil
      _G[target.."leftlegdisablelimbdamage"] = nil
   end
end

