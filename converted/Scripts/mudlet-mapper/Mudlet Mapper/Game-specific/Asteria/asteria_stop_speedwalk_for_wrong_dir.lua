function asteria_stop_speedwalk_for_wrong_dir()
  if mmp.game and mmp.game ~= "asteria" then
    return
  end
  if #mmp.speedWalkPath > 0 then
    echo("Can't go \"" .. gmcp.Room.WrongDir .. "\". Stopping speedwalk.")
    mmp.stop()
  end
end
