-- self limb damage table
wsys = wsys or {}
wsys.tb = wsys.tb or {}
wsys.tb.selflimbdamage = wsys.tb.selflimbdamage or {
	["head"] = {damage = 0,},
	["torso"] = {damage = 0,},
	["left arm"] = {damage = 0,},
	["right arm"] = {damage = 0,},
	["left leg"] = {damage = 0,},
	["right leg"] = {damage = 0,},
}

local off_limbs = {
	head = "torso",
	torso = "head",
	["left arm"] = "right arm",
	["right arm"] = "left arm",
	["left leg"] = "right leg",
	["right leg"] = "left leg",
}

local timers = timers or {}

wsys.lastlimbhit = wsys.lastlimbhit or "left leg"

-- BM: Main slash 1.5, off slash 1, compassslash 1.5, drawslash = ? These are rough guesses.
-- Psion: breaks in 4
-- Dragon: breaks in 4
	
local attacks = {
  ["snb rend"] = 1.75,
  ["legslash"] = 1.5,
  ["armslash"] = 1.5,
  ["centreslash"] = 1.5,
  ["compassslash"] = 1.5,
  ["drawslash"] = 1.3
  }
	
local off_attacks = {
  ["legslash"] = 1,
  ["armslash"] = 1,
  ["centreslash"] = 1,
}

function wsys.my_limb_hit(limb, attack)
  selectString(limb, 1)
  setItalics(true) fg("white") bg("blue")
  resetFormat() deselect()
  tempLineTrigger( 1, 1, [[wsys.my_limb_hit_next_line("]]..limb..[[","]]..attack..[[")]])
end

function wsys.my_limb_hit_next_line(limb, attack)
  if line:match("You parry the attack with a deft manoeuvre.")
    or line:match( "The attack rebounds back onto %w+!" )
    or line:match( "The attack rebounds onto %w+!" )
    or line:match( "%w+ misses you with " )
    or line:match( "You dodge nimbly out of the way." )
    or line:match( "One of your reflections has been destroyed" )
    or line:match( "You twist your body out of harm's way." )
    or line:match( "You quickly jump back, avoiding the attack." )
    or line:match( "The attack rebounds off your rebounding aura!" )
    or line:match( "You frantically attempt to parry the attack of %w+, but succeed only in redirecting it." )
    or line:match( "You move inside %w+'s guard, deflecting %w+ attack to one side with your forearm before countering with a swift blow to %w+ temple.")
    or line:match( "%w+'s blow lands upon you but is robbed of much of its impact by %w+ flawed technique." ) then -- psion only
  else
    wsys.my_limb_hit_add( limb, attack )
  end
end

function wsys.my_limb_hit_add(limb, attack)
  wsys.lastlimbhit = limb
	
  if off_attacks[attack] then
    wsys.addSelfDamage(off_limbs[limb], off_attacks[attack])
  end
	
  wsys.addSelfDamage(limb, attacks[attack] or 1 )
  selectString(limb, 1)
  setItalics(true) fg("white") bg("blue")
  resetFormat() deselect()
  raiseEvent("myLimbHit", limb, attack)
end

function wsys.resetSelfDamage(limb)
  wsys.clearSelfDamage(limb)
  cecho("<seashell>Self "..limb.." timed out!")
end

function wsys.addSelfDamage(limb, n)
  wsys.tb.selflimbdamage[limb].damage = wsys.tb.selflimbdamage[limb].damage + n
  timers[limb] = timers[limb] or {}
  if timers[limb].timer then killTimer( timers[limb].timer ) end
  timers[limb].timer = tempTimer( 180, [[wsys.resetSelfDamage("]]..limb..[[")]] )
end

function wsys.clearSelfDamage(limb)
  wsys.tb.selflimbdamage[limb].damage = 0
  if timers[limb] and timers[limb].timer then killTimer( timers[limb].timer ) end
  timers[limb] = nil
end

function wsys.clearSelfDamageAll()
  for limb,_t in pairs( wsys.tb.selflimbdamage ) do
    wsys.clearSelfDamage( limb )
  end
end

function wsys.brokenLimbListener(event, affliction)
  -- GMCP triggers before the limb hit line, so don't rely on gmcp to call the got aff event here
  if event == "got aff" or event == "lost aff" then
    if affliction == "damagedleftarm" or affliction == "mangledleftarm" then
      wsys.clearSelfDamage("left arm")
    elseif affliction == "damagedrightarm" or affliction == "mangledrightarm" then
      wsys.clearSelfDamage("right arm")
    elseif affliction == "damagedleftleg" or affliction == "mangledleftleg" then
      wsys.clearSelfDamage("left leg")
    elseif affliction == "damagedrightleg" or affliction == "mangledrightleg" then
      wsys.clearSelfDamage("right leg")
    elseif affliction == "damagedhead" or affliction == "mangledhead" then
      wsys.clearSelfDamage("head")
    elseif affliction == "mildtrauma" or affliction == "serioustrauma" then
      wsys.clearSelfDamage("torso")
    end
  end
end

if wsys.events.limbhit_lost_aff then killAnonymousEventHandler( wsys.events.limbhit_lost_aff ) end

wsys.events.limbhit_lost_aff = registerAnonymousEventHandler("lost aff", "wsys.brokenLimbListener")
