local butterfly_blind_shifted = false

function wsys.butterflyDescended()
	-- If prone, set blindness priority to 2 until not prone or blind cured
	if wsys.aff.prone and not wsys.def.blindness then
		-- Set blindness priority 2
		butterfly_blind_shifted = true
		wsys.switchDefPrios( "blindness", 2 )
	end
end


function wsys.blindShiftCheck(event, affliction, class)
  if butterfly_blind_shifted and
     ( event == "got aff" and affliction == "blindness" ) or
	   ( event == "lost aff" and affliction == "prone" ) then
		-- Reset blindness priority
		butterfly_blind_shifted = false
		wsys.defPrioRestore( "blindness" )
  end
end --func

if wsys.events.blind_check_got_aff then killAnonymousEventHandler( wsys.events.blind_check_got_aff ) end
if wsys.events.blind_check_lost_aff then killAnonymousEventHandler( wsys.events.blind_check_lost_aff ) end

wsys.events.blind_check_got_aff = registerAnonymousEventHandler("got aff", "wsys.blindShiftCheck")
wsys.events.blind_check_lost_aff = registerAnonymousEventHandler("lost aff", "wsys.blindShiftCheck")
