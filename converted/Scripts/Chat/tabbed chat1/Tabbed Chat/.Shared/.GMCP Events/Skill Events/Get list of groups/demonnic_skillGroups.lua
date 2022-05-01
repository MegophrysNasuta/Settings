function demonnic_skillGroups()
  demonnic.skills = {}
  for _,extra in ipairs(gmcp.Char.Skills.Groups) do
    skillstring = string.format("Char.Skills.Get %s", yajl.to_string({group=extra.name}))
    sendGMCP(skillstring)
  end
  send("\n")
end
