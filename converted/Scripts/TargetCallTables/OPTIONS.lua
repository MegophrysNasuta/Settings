TargetCallTables = (TargetCallTables or {})
TargetCallTables.Config = (TargetCallTables.Config or {})
TargetCallTables.targetPrios = (TargetCallTables.targetPrios or {})

-- == -- == -- == CONFIG OPTIONS == -- == -- == --
TargetCallTables.Config.EchoColor = 'cyan'
TargetCallTables.Config.ShowEchoes = true

TargetCallTables.Config.UI = true
TargetCallTables.Config.UITableCols = 2
TargetCallTables.Config.UITableRows = 10
TargetCallTables.Config.UIFontSize = 11
TargetCallTables.Config.UIXPos = "40%"
TargetCallTables.Config.UIYPos = "0px"
TargetCallTables.Config.UIWidth= "350px"
TargetCallTables.Config.UIColor = 'cyan'
-- == -- END OF CONFIG: DO NOT EDIT BELOW -- == --

TargetCallTables.echo = function(msg)
  if not TargetCallTables.Config.ShowEchoes then return end
  local color = TargetCallTables.Config.EchoColor
  cecho('\n<'.. color ..'>'.. msg ..'\n')
end

TargetCallTables.addTarget = function(index, tar)
  TargetCallTables.echo('Setting target '.. tostring(index) ..' to '.. tar)
  TargetCallTables.targetPrios[tonumber(index)] = tostring(tar):lower():title()
  TargetCallTables.showTable()
end

TargetCallTables.callTarget = function(index)
  local num = tonumber(index)
  local tar = TargetCallTables.targetPrios[num]
  if tar == nil then
    cecho('\n<red>No target in slot '.. tostring(index) ..'!\n')
    return
  end
  TargetCallTables.lastTargetIndex = num
  target = tar
  sendAll('st '.. tar, 'pt Target: '.. tar)
end

TargetCallTables.nextTarget = function()
  local lastTargetIndex = (TargetCallTables.lastTargetIndex or 0)
  if lastTargetIndex == #TargetCallTables.targetPrios then
    cecho('\n<orange>WARNING: Looping to beginning of call table (out of targets).')
    cecho('\n<orange>=============================================================')
    cecho('\n<orange>REPEAT THE COMMAND TO CALL TARGET #1')
    TargetCallTables.lastTargetIndex = 0
    return
  end
  TargetCallTables.callTarget(lastTargetIndex + 1)
end

TargetCallTables.setTargets = function(tarTable)
  TargetCallTables.targetPrios = {}
  for index, target in pairs(tarTable) do
    TargetCallTables.addTarget(index, target)
  end
end

TargetCallTables.showTable = function()
  if not TargetCallTables.Config.UI then return end
  
  local tbl = '<table width="100%">'
  local row = 0
  while row < TargetCallTables.Config.UITableRows do
    row = row + 1
    local col = 0
    tbl = tbl ..'<tr>'
    while col < TargetCallTables.Config.UITableCols do
      local idx = (col * 10) + row
      local t = TargetCallTables.targetPrios[idx] or "&nbsp;"
      tbl = tbl ..'<td>'.. tostring(idx) ..'. '.. t ..'</td>'
      col = col + 1
    end
    tbl = tbl ..'</tr>'
  end
  tbl = tbl ..'</table>'

  TargetCallTables.UITable = Geyser.Label:new({
    name="TargetCallTables_UITable",
    x=TargetCallTables.Config.UIXPos, y=TargetCallTables.Config.UIYPos,
    width=TargetCallTables.Config.UIWidth,
    height=(TargetCallTables.Config.UIFontSize + 10) * TargetCallTables.Config.UITableRows,
    bgColor="black", fgColor=TargetCallTables.Config.UIColor,
    message = "<center>".. tbl .."</center>"
  })
  TargetCallTables.UITable:setFontSize(TargetCallTables.Config.UIFontSize)
end
