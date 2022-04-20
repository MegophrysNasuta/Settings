wsys.mount_flags = wsys.mount_flags or {}

function wsys.autoMount( enable )
  if wsys.settings.automount == nil then wsys.settings.automount = false end
  if enable then
    wsys.setSettings( "automount", "true" )
  else
    wsys.setSettings( "automount", "false" )
  end
  wsys.checkAutoMount()
end

function wsys.mountToggle()
  wsys.autoMount( not wsys.settings.automount )
end

function wsys.mountUp( mount )
  if type(mount) == "string" then
    wsys.setSettings( "mount", string.trim(mount) )
    wsys.autoMount( true )
  else
    wsys.autoMount(mount)
  end
end

function wsys.checkAutoMount()
  local break_early = ( gmcp == nil or gmcp.Char == nil ) or wsys.isDragon()
  if break_early then
    return
  end

  if ( wsys.settings.automount and wsys.def.mounted ) or
     ( not wsys.settings.automount and not wsys.def.mounted ) then
    wsys.mount_flags.trying = false
	
  elseif wsys.cancure() and not wsys.isHindered() and not wsys.mount_flags.trying and wsys.bals.b and wsys.bals.e and not wsys.aff.hamstrung then
    if wsys.settings.automount and not wsys.def.mounted then
      enableTrigger("Mount")
      wsys.osend(wsys.mountCommand().." ".. wsys.settings.mount )
      wsys.mount_flags.trying = true
      if wsys.mount_flags.remountTimer then killTimer(wsys.mount_flags.remountTimer) end
      wsys.mount_flags.remountTimer=tempTimer(1,[[wsys.mount_flags.trying = false; wsys.checkAutoMount()]])
    elseif not wsys.settings.automount and wsys.def.mounted then
      wsys.dismount()
      wsys.mount_flags.trying = true
      if wsys.mount_flags.remountTimer then killTimer(wsys.mount_flags.remountTimer) end
      wsys.mount_flags.remountTimer=tempTimer(1,[[wsys.mount_flags.trying = false; wsys.checkAutoMount()]])
    end
  end
end

if wsys.events.mount_aff_got then killAnonymousEventHandler( wsys.events.mount_aff_got ) end
wsys.events.mount_aff_got = registerAnonymousEventHandler( "got aff", function( event, aff )
	if event == "got aff" and aff == "prone" then
		wsys.def.mounted = false
	end
end)


