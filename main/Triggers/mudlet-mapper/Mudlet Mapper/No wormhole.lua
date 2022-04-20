if mmp.speedWalkDir and mmp.speedWalkDir[speedWalkCounter] and mmp.speedWalkDir[speedWalkCounter]=="worm warp" then
  mmp.echo("Missing wormhole detected, locking wormhole and trying new path...")

  lockSpecialExit(mmp.currentroom, mmp.speedWalkPath[speedWalkCounter], "worm warp", true)

  local destination = mmp.speedWalkPath[#mmp.speedWalkPath]

  mmp.stop()

  mmp.clearpathcache() -- clear cache so mmp.getPath accounts for the new way

  if not mmp.getPath(mmp.currentroom, destination) then
    mmp.echo(string.format("Don't know how to get to %d (%s) anymore :( Move into a room we know of to continue", destination, getRoomName(destination)))
  else
    mmp.gotoRoom(destination)
  end
end
