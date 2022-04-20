function demonnic_skillsList()
  local group = gmcp.Char.Skills.List.group
  local list = gmcp.Char.Skills.List.list
  if group then
    if not demonnic.skills then demonnic.skills = {} end
    demonnic.skills[group] = list
    raiseEvent("demonnicSkillFilled", group)
  end
end
