--if not getSpecialExitsSwap or mmp.settings.lockwormholes then return end
if not getSpecialExitsSwap then return end

local exits = getSpecialExitsSwap(mmp.currentroom)
if exits and exits["worm warp"] then
  cecho(string.format("\n<DarkSlateGrey>A wormhole is here, leading to: <orange_red>%s (#%d)<DarkSlateGrey> in %s.\n", getRoomName(exits["worm warp"]), exits["worm warp"], mmp.cleanAreaName(mmp.getAreaName(exits["worm warp"]))))
end
