function dragonswords_stop_speedwalk_for_wrong_dir()
  if mmp.game and mmp.game ~= "dragonswords" then
    return
  end
  if #mmp.speedWalkPath > 0 then
    echo("The way \"" .. gmcp.Room.WrongDir .. "\" is blocked. Stopping speedwalk.")
    mmp.stop()
  end
end