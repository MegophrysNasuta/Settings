if focusVibes or retardVibeHit then
  focusVibes = false
  retardVibeHit = false
  --yay it's a real retard mode, letsa go!
  wsys.retardationOn()
elseif not wsys.aff.aeon and not wsys.aff.blackout and not wsys.retard then
  wsys.retardationOn()
elseif checkingForRetardation and not wsys.retard then
  --retard flag set to true, time to get going
  wsys.retardationOn()
  checkingForRetardation = false
elseif checkingForRetardation and wsys.retard then
  --still in retardation I guess.
end

if wsys.retard then wsys.retardationDownCheck() end

