if multimatches[2][1]:find("City of") and cdb.gettingenemies then
  cdb.enemies = {}
  for _, n in pairs(string.split(multimatches[4][1], ",")) do
    cdb.enemies[n:trim()] = true
  end
  echo("\n")
  cdb.echo("Updated <orange>city enemies <white>list.")
  cdb.gettingenemies = false
  cdb.save()
end
