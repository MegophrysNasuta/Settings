function wsys.focusshifthandler(event, bal)
	-- Shift when off both focus and herb balance. Only restore when both are back
  if event == "got bal" and not wsys.settings.stopfocus and ( ( bal == "focus" and wsys.bals.herb ) or ( bal == "herb" and wsys.bals.focus ) ) then
    wsys.onfocusbalprios()
  elseif event == "lost bal" and ( ( bal == "focus" and not wsys.bals.herb ) or ( bal == "herb" and not wsys.bals.focus ) ) then
    wsys.offfocusbalprios()
  end
end

registerAnonymousEventHandler("got bal", "wsys.focusshifthandler")
registerAnonymousEventHandler("lost bal", "wsys.focusshifthandler")

function wsys.offfocusbalprios()
  for k,v in pairs(wsys.settings.focusshifts[wsys.profile][wsys.myClass()]) do
    wsys.switchPrios(k, v)
  end
end

function wsys.onfocusbalprios()
  for k,v in pairs(wsys.settings.focusshifts[wsys.profile][wsys.myClass()]) do
    wsys.affPrioRestore(k)
  end
end

function wsys.focusshiftsdisplay()
  wsys.report("Focus shifts (" .. wsys.profile .. "):")
  for k,v in wsys.spairs(wsys.settings.focusshifts[wsys.profile][wsys.myClass()], function(t,a,b) return t[b] > t[a] end) do
    cecho("<white>\n"..k .. ": " .. v)
    local aliasone = "wconfig focusshift " .. k .. " " .. tonumber(v) + 1
    local commandone = [[expandAlias("]]..aliasone..[[")]]
    echo(" ")
    echoLink("(+)", commandone, "Move 'down' " .. k, true)
    echo(" ")
    local aliastwo = "wconfig focusshift " .. k .. " " .. tonumber(v) - 1
    local commandtwo = [[expandAlias("]]..aliastwo..[[")]]
    echoLink("(-)", commandtwo, "Move 'up' " .. k, true)
  end
end

function wsys.setfocusshift(affliction, prio)
  if (tonumber(prio) > 0) and (tonumber(prio) <= 26) then
    wsys.settings.focusshifts[wsys.profile][wsys.myClass()][affliction] = tonumber(prio)
    wsys.report("Set " .. aff .. " to " .. prio .. " on focus shift (if off focus balance).")
  else
    wsys.report("Cannot set a prio lower than 1 or higher than 26.")
  end
  wsys.focusshiftsdisplay()
end

function wsys.return_defaultfocusshifts()
  return {
    recklessness = 12,
    confusion = 8,
    stupidity = 9,
    dizziness = 14,
    shyness = 14,
    paranoia = 14,
    dementia = 14,
    hallucinations = 14
  }
end
