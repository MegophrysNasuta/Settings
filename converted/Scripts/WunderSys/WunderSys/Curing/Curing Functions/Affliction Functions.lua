wsys.predicted = {}

---------------------------------------------------
-- Translation layer to map wsysf.affs to wsys.aff
---------------------------------------------------

-- Note, this meta table allows you to access the values
-- From wsysf.affs, but it does not automatically map pairs()
-- or next(). Both of these will always be empty
wsys.aff = setmetatable({}, {
	__index = function(table, key)
		return wsysf.affs[key] or wsys.predicted[aff]
	end,
	__newindex = function(table, key, value)
		echo("!Don't set wsys.aff."..key.." = "..tostring(value))
	end
})

local wsysf_aff_event_handler = function( event, affliction )

	if wsys.predicted[ affliction ] then wsys.predicted[ affliction ] = nil end
	
	wsys.checkaffs_next_prompt()
	
	if event == "wsysf got aff" then
		raiseEvent( "got aff", affliction )
	elseif event == "wsysf lost aff" then
		raiseEvent( "lost aff", affliction )
	end
end

if wsys.events.aff_add then killAnonymousEventHandler( wsys.events.aff_add ) end
if wsys.events.aff_remove then killAnonymousEventHandler( wsys.events.aff_remove ) end
if wsys.events.aff_list then killAnonymousEventHandler( wsys.events.aff_list ) end

wsys.events.aff_add = registerAnonymousEventHandler("wsysf got aff", wsysf_aff_event_handler)
wsys.events.aff_remove = registerAnonymousEventHandler("wsysf lost aff", wsysf_aff_event_handler)
wsys.events.aff_list = registerAnonymousEventHandler("gmcp.Char.Afflictions.List", function() wsys.predicted = {} end)

function wsys.affpredict(aff, value)
  if value == nil then value = true end
	
	if not wsysf.affs[aff] and wsys.predicted[aff] ~= value then
		if value then
			send("curing predict "..aff) -- ,false)
		else
			send("curing unpredict "..aff) -- ,false)
  		end
  		wsys.predicted[aff] = value
	end
end
	
---------------------------------------------------
-- Old Aff tracking functions. Some of these may
-- functions may no longer be needed
---------------------------------------------------
	
-- Deprecated in favour of pure GMCP aff tracking
-- This is only used for class tracking and the aff print lines now
function wsys.affadd(affliction, class, time, from_gmcp)
  if not wsys.lifevision then
    local gained = wsys.affs_gained[affliction]
    if not from_gmcp and wsys.affline ~= getLineNumber() then
      wsys.affprint(affliction)
    end -- if

    if class then wsys.newClassTimer( class ) end

    if not from_gmcp then
      wsys.affline = getLineNumber()
    end
  end -- if
end -- func


function wsys.affcured(affliction)
 if not wsys.lifevision then
  if wsys.aff.blackout then
   wsys.affcheckblackout(affliction)
   do return end
  end -- if
  if (wsys.cure and table.contains(wsys.tb.affc[affliction], wsys.cure)) or (wsys.applying and table.contains(wsys.tb.affc[affliction], wsys.applying)) or wsys.cure == "tree" or wsys.cure == "dheal" or wsys.cure == "fool" or affliction == "aeon"  or affliction == "inquisition" or affliction == "crone" or wsys.cure == "corrupt" or affliction == "sleeping" or wsys.cure == "passive" or wsys.cure == "shrugging" then
   wsys.affcuredconfirm(affliction)
   if wsys.targettedCure(wsys.cure) then
     --wsys.curedAICheck(affliction)
   end
  end -- if 
 end -- if
 --wsys.checkaffs()
end -- func


function wsys.affcuredconfirm(affliction, from_gmcp)
  if affliction == "aeon" then
    wsys.def.speed = false
  end -- if

  if not from_gmcp then
    disableTrigger(string.title(affliction) .. " -")
    wsys.affcureprint(affliction)
  end

  wsys.checkaffs(affliction)

  if wsys.timer[affliction.."decay"] then 
    killTimer(wsys.timer[affliction.."decay"])
    wsys.timer[affliction.."decay"] = nil
  end
end -- func


function wsys.affcheckblackout(affliction)
 for k,v in ipairs(wsys.tb.affc[affliction]) do
  if wsys.eating == v then
   wsys.ate(wsys.eating)
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if wsys.applying == v then
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if wsys.pipes.smoking == v then
   wsys.smoked(wsys.pipes.smoking)
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if v == "focus" and wsys.timer.focuswait then
   wsys.focused()
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if v == "restore" and wsys.timer.restorewait then
   wsys.restored()
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if v == "immunity" and wsys.timer.immunitywait then
   immunityd()
   wsys.affcuredconfirm("voyria")
   do return end
  end -- if
  if v == "stand" and wsys.cure == "stand" then
   wsys.affcuredconfirm("prone")
   do return end
  end -- if
  if v == "fitness" and wsys.timer.fitnesswait then
   wsys.fitnessd()
   wsys.affcuredconfirm("asthma")
   do return end
  end -- if
  if wsys.timer.dhealwait then
   wsys.dhealed()
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
  if wsys.timer.foolwait then
   fooled()
   wsys.affcuredconfirm(affliction)
   do return end
  end -- if
 end -- for
 if affliction == "aeon" then
  wsys.affcuredconfirm("aeon")
 end -- if
end -- func


local affs_next_prompt_id = nil
function wsys.checkaffs_next_prompt()
	if not affs_next_prompt_id then
		affs_next_prompt_id = tempPromptTrigger( function()
			affs_next_prompt_id = nil
			wsys.checkaffs()
		end, 1)
	end
end

function wsys.checkaffs()
 wsys.lockqueue()
end -- func
    

function wsys.firequeues()
 if wsys.lifevision then
  wsys.tb.affstogether = {}
  if not wsys.self_illusion then cecho("<pink>ILLUSION BITCH!") end
  do return end
 end -- if
 
 if wsys.aff.aeon then
  if wsys.retard then
   --retardqueue()
  else
   --aeonqueue()
  end -- if
  do return end
 end -- if

 wsys.ragequeue()
 wsys.lockqueue()
end -- func


function wsys.pairscheck(cure) -- What is this for?
 wsys.checkaffs()
end -- func


function wsys.unstunned()
 wsys.cleartimers()
 wsys.checkaffs()
 wsys.canaction()
end -- func

if wsys.events.blackoutloss then killAnonymousEventHandler( wsys.events.blackoutloss ) end
wsys.events.blackoutloss = registerAnonymousEventHandler( "lost aff", "wsys.blackoutloss" )

function wsys.blackoutloss( event, affliction )
  if event == "lost aff" and affliction == "blackout" then
    disableTrigger("Blackout -")
    tempPromptTrigger(function()
      if not wsys.bals.e then
      	send("curing predict disrupted", false)
      end -- if
      if wsys.stats.h == wsys.stats.maxh and wsys.stats.m == wsys.stats.maxm then
        wsys.affpredict("recklessness")
      end -- if
      if not wsys.aff.aeon and wsys.classTimerExists("occultist") or wsys.classTimerExists("jester") or wsys.classTimerExists("shaman") then
      	send("curing predict aeon")
      end
      --send("plist")
      if not wsys.aff.aeon then
      	send("curing queue add speed")
      end
    end, 1)
  end
end -- func

function wsys.return_defaultaffprios()
  return {
    ---------------------------------
    --HERBS (+ a few focusables obv)
    ---------------------------------
    -- depsthwalker priors: paralysis > timeloop > madness/depression > retribution > parasite
    ["paralysis"] = 4,
    ["timeloop"] = 5,
    ["hypochondria"] = 5,
    ["shadowmadness"] = 6,
    ["depression"] = 6,
    ["retribution"] = 6,	-- This should be > madness, but < parasite. So either 6 or 7
    ["scytherus"] = 6,
    ["impatience"] = 6,
    ["parasite"] = 7,
    ["asthma"] = 7,
    ["sensitivity"] = 7,
    ["weariness"] = 7,
    ["guilt"] = 8,
    ["darkshade"] = 8,
    ["hypersomnia"] = 9,
    ["hallucinations"] = 9,
    --10 GAP FOR OFF-FOCUS BAL SHIFTS
    ["nausea"] = 11,
    ["haemophilia"] = 11,
    ["lethargy"] = 11,
    ["addiction"] = 11,
    ["tenderskin"] = 11,
    ["spiritburn"] = 11,
    --13 GAP
    ["temperedmelancholic"] = 14,
    ["temperedcholeric"] = 14,
    ["temperedsanguine"] = 14,
    ["temperedphlegmatic"] = 14,
    ["lovers"] = 14, 
    ["pacified"] = 14, 
    ["healthleech"] = 14,
    ["clumsiness"] = 14,
    ["dissonance"] = 14,
    ["loneliness"] = 16,
    ["claustrophobia"] = 16,
    ["agoraphobia"] = 16,
    ["vertigo"] = 16,


    ["peace"] = 16, 
    ["justice"] = 16, 
    ["generosity"] = 16,

    ["dementia"] = 17,
    ["paranoia"] = 17,

    ["stupidity"] = 18, --move to 9 if off focus balance
    ["epilepsy"] = 18,
    ["confusion"] = 20, --move to 2 if disrupted, move to 8 if off focus balance
    ["recklessness"] = 21, --move up higher if off focus balance
    ["masochism"] = 21,

    ["dizziness"] = 23, --if off focus balance move this to 14? Seems too high honestly.
    ["shyness"] = 23, --if off focus balance move this to 14?

    --------------------------
    --SALVE
    --------------------------
    ["heartseed"] = 3,
    ["hypothermia"] = 3,
    ["anorexia"] = 4,
    ["crushedthroat"] = 5,
    ["itching"] = 5,

    --6 GAP: For resto leg breaks and prone

    ["brokenleftleg"] = 7,
    ["brokenrightleg"] = 7,

    ["damagedleftleg"] = 8, --move these up if prone so Sents can't screw me over.
    ["damagedrightleg"] = 8,
    ["mangledleftleg"] = 8,
    ["mangledrightleg"] = 8,

    ["mangledhead"] = 9,

    ["brokenleftarm"] = 10,
    ["brokenrightarm"] = 10,

    ["damagedleftarm"] = 11,

    ["damagedhead"] = 12,
    ["concussion"] = 12,

    ["damagedrightarm"] = 13,

    ["mangledleftarm"] = 14,
    ["mangledrightarm"] = 14,

    ["frozen"] = 15,
    ["shivering"] = 15, --same rank as frozen
    --CALORIC(insulation) at 15 unless it's a damn sentinel, then move up to 2 along with frozen and shivering
    ["scalded"] = 16,
    ["mildtrauma"] = 17,
    ["serioustrauma"] = 17,

    --MASS at 18

    ["burning"] = 19,
    ["stuttering"] = 19,
    ["slashedthroat"] = 19,
    ["laceratedthroat"] = 19,
    ["selarnia"] = 20,

    --broken = crippled
    --damaged = broken
    --mangled = mangled
    --lvl1 torso = mildtrauma
    --lvl2 torso = serioustrauma

    ---------------------------
    --PIPE
    ---------------------------
    ["aeon"] = 2,
    ["slickness"] = 3, --1 higher than para so that smoke > eat broot if para and slick.
    ["whisperingmadness"] = 11,
    ["hellsight"] = 12,
    -- From Oblive - Air Lord priority: manaleech>deadening>disloyalty>tension>pressure
    ["manaleech"] = 13,
    ["deadening"] = 14,
    ["disloyalty"] = 15,
    ["pressure"] = 16,
    ["tension"] = 17,	--  Pressure > Tension, unless sent airborne, then swap

    --["rebounding"] = 18, (DEFENCE QUEUE SLOT 18) IMPORTANT TO MOVE THIS DOWN BELOW PRESSURE

    ------------------------
    --HEALTH ELIXIR
    ------------------------
    ["skullfractures"] = 8,
    ["crackedribs"] = 9,
    ["torntendons"] = 10,
    ["wristfractures"] = 11,

    -------------------------
    --WRITHE
    -------------------------
    ["bound"] = 6,
    ["transfixation"] = 6,
    ["webbed"] = 6,
    ["entangled"] = 6,
    ["daeggerimpale"] = 6,
    ["impaled"] = 6,

    -----------------------
    --BAL FREE CURES
    -----------------------
    ["sleeping"] = 2,
    ["voyria"] = 9,
    ["prone"] = 9,
    ["disrupted"] = 9,
    ["fear"] = 20, --low for retardation/aeon curing

  }
end
