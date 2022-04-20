function wsys.impatiencePrio(event, affliction, class)
  if event == "got aff" then
    if wsys.aff.paralysis and wsys.aff.asthma and not wsys.classTimerExists("alchemist") then
      wsys.switchPrios("impatience", 1 )
		else -- Sentinel petrify kill requires unblind + 4 mentals
			local focus_count = wsys.affamount("focus")
			if wsys.aff.impatience and focus_count >= 2 then
				wsys.switchPrios("impatience", 2 )
			end
    end
  end
end --func

registerAnonymousEventHandler("got aff", "wsys.impatiencePrio")
registerAnonymousEventHandler("reset aff prios", "wsys.impatiencePrio")

function wsys.impatienceLost(event, affliction)
  if event == "lost aff" then
		local focus_count = wsys.affamount("focus")
    if (wsys.affPosition("impatience") ~= wsys.defaultAffPosition("impatience")) and not (wsys.aff.paralysis and wsys.aff.asthma and focus_count < 2) then
      wsys.affPrioRestore( "impatience" )
    end
  end
end --func

registerAnonymousEventHandler("lost aff", "wsys.impatienceLost")
