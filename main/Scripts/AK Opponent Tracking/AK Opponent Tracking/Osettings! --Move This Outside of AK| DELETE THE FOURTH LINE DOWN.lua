--osettings
ak = ak or {}

ak.MovementKeys = ak.MovementKeys or {"Tecton","Maya"}--add yourself here to allow num key movement
ak.disableAllEchos = false --Set to Disable Relays and Prompt
ak.nodisplay = false  --Set to True to Turn off Display!  Always Retarget something to refresh.
ak.expertdiagnose = false --Set to False to Disable ED
ak.obacktrack = true  --Set to False to Disable Backtracking
ak.oprotrack = true --If you do unknown affs, do not enable this
ak.owhy = true --If you do not have 100% accurate affliction information(group fighting/Illusion), do not enable this
ak.highlighttarget = false --Self Explanatory
------------------------------------------------------------------------------------------------------------------

ak.spear = "a Stormspear"                          --This is for Spear Venom Tracking Purposes
ak.odirk = "Thoth's fang"                          --This is for Dstab Venom Tracking Purposes

-------------------------------------------------------------------------------------------------------------------

--Adding your weapons to limb counter:
ak.limbs = ak.limbs or {} 
ak.limbs.myweapons = ak.limbs.myweapons or {

		--Proximity Values.  Finds the closest to our target health and uses that.
		--These are percentage values, so a single stab vs 4000 health target will do 9% damage.
   ["a Soulpiercer"] = {
      [2563] = 7,
      [4000] = 9,
      [5000] = 10,
      [6000] = 11,
   },
   ["a Logosian longsword"] = {
      [2563] = 7,
      [4000] = 9,
      [5000] = 10,
      [6000] = 11,
   },
}

--Adding your custom limb formula:

ak.limbs.myformulas = {} 

--Must retain formatting as a function and us ak's called weapon in function name(example is hfp).  
--Limbs break at 100, ergo these should return a percentage. Dragon rend would return 25

function ak.limbs.myformulas.hfp(who, attacker, weapon, limb, augment, check)
	local whomaxhealth = ak.limbs.FindTargetHealth(who)
  local damage = 0
	damage = roundUp(.0897*whomaxhealth+227*1.35,0)
	damage = (100 * damage/whomaxhealth) --Converting to a percentage
	return damage  
end

---------------------------------------------------------------------------------------------------------------------

--OBVIOUSLY YOU DON"T WANT TO LOOK LIKE YOU ARE USING MY SYSTEM!  PEOPLE MIGHT LOOK DOWN ON YOU!!

function EchoForAddedAff(incoming)
   cecho("<white>\nProcessed Affliction(<yellow>" ..incoming.. "<white>)")  --Change this line for added afflictions
end
function EchoForLostAff(incoming)
   cecho("<white>\nLost Affliction(<yellow>" ..incoming.. "<white>)")  --Change this line for removed afflictions
end  
function EchoForPossibleCures(incoming)
   cecho("<white>\nProcessed Cures(<yellow>" ..incoming.. "<white>)")  --Change this line for removed afflictions
end 
function EchoForMajorAff(incoming,color,color2,color3)
	local color = color or "red"
	local color2 = color2 or "cyan"
	local color3 = color3 or "green"
	cecho("\n<purple> --------------------------------------------------------------")
	cecho("\n<"..color.."> --------------------<"..color2..">GOT<"..color3.."> "..incoming.."<"..color..">!!--------------------------")
	cecho("\n<"..color.."> --------------------<"..color2..">GOT<"..color3.."> "..incoming.."<"..color..">!!--------------------------")
	cecho("\n<"..color.."> --------------------<"..color2..">GOT<"..color3.."> "..incoming.."<"..color..">!!--------------------------")
	cecho("\n<"..color.."> --------------------<"..color2..">GOT<"..color3.."> "..incoming.."<"..color..">!!--------------------------")
	cecho("\n<"..color.."> --------------------<"..color2..">GOT<"..color3.."> "..incoming.."<"..color..">!!--------------------------")
	cecho("\n<purple> --------------------------------------------------------------")
end


----------------------------------------------------------------------------------------------------------------------

--USE THIS TO SET YOUR SERVERSIDE ALIASES FOR YOU, DEPENDING ON THEIR AFFS
--THEN SIMPLY CALL YOUR SERVERSIDE ALIAS


function ak.mycustomoffense()
   if ak.stack == "example" then --make stack variable default below
      --venom_select()
      --attack_select()
      --additional_attack_decision()
      --set_server_side_aliases_using_info_from_above()
	 elseif ak.stack == "dragon" then
			ak.dragon.default.main() 
   end
end

----------------------------------------------------------------------------------------------------------------------

--*

--Svo Prompt--

--add ^y@ml_oprompt to your custom prompt

--*


--WYS Prompt--

--type wshow display

--add @owysprompt into your prompt



-----------------------------------------------------------------------------------------------------------------------



