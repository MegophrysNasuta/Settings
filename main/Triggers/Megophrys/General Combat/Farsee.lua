Megophrys.Util.gagLine()

cecho('\n<light_goldenrod>Found '.. matches[2] ..' near '.. matches[3] ..'\n')
if matches[1]:starts('You see that') then
  Megophrys.highlightTargetRoom(matches[3], matches[2])
end
