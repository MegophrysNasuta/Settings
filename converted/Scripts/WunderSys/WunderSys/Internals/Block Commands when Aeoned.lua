function wsys.denyInputOnAeon(_, command)
  if wsys.aff.aeon and not wsys.retard and not wsys.paused and wsys.settings.aeonblock then
    --check if Serverside curing command or amnesia cure
    if not string.starts(command, "curing") and command ~= "touch flaws" and command ~= "diagnose" and command ~= "queue add eqbal touch shield" then
      denyCurrentSend()
      cecho("\n<white:DeepPink>Denied (aeonblock) :<white> " .. command .. " <white:DeepPink> CURING AEON!")
    end
  end --if
end

registerAnonymousEventHandler("sysDataSendRequest", "wsys.denyInputOnAeon")
