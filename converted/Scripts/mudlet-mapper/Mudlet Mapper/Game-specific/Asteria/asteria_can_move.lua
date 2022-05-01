-- Asteria's GMCP butts heads with existing GMCP 'able' checks in the speedwalking script. This works around it.

function asteria_can_move(_, game)
  if game ~= "Asteria" then
    return
  end

  function mapper_can_move()
    return gmcp.Char and gmcp.Char.Balance and gmcp.Char.Balance.balance == 0
  end
end
