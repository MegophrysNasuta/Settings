wsys.toparry = wsys.toparry or false

local parryTable = {
  ["ll"] = "left leg",
  ["rl"] = "right leg",
  ["la"] = "left arm",
  ["ra"] = "right arm",
  ["h"] = "head",
  ["t"] = "torso",
  ["n"] = "nothing",
}

function wsys.parrying(limb)
  wsys.def["parry"] = limb
  wsys.toparry = false
end  --func

function wsys.parrynothing()
  wsys.def["parry"] = false
  wsys.toparry = false
end

function wsys.parryf(l)
  local limb = parryTable[l]
  if not wsys.toparry and wsys.def.parry ~= limb and (wsys.settings.haveparry or wsys.isDragon()) then
    wsys.toparry = limb
    if wsys.toparry then
      wsys.parryFunction()
      if wsys.timer.parryftimer then
        killTimer(tostring(wsys.timer.parryftimer))
        wsys.timer.parryftimer = tempTimer(5, [[wsys.timer.parryftimer = nil;wsys.toparry = false]])
      end
    end
  end
end --func


function wsys.parryFunction()
  if wsys.isDragon() then
    wsys.dofreeadd("clawparry " .. wsys.toparry)
  elseif wsys.isClass("monk") then
    wsys.dofreeadd("guard " .. wsys.toparry)
  else
    wsys.dofreeadd("parry " .. wsys.toparry)
  end -- if
end --func


