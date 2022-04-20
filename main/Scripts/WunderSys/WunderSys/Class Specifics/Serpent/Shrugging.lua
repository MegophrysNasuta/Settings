--check if you should shrug or not.
--run this on every aff gain and loss event
function wsys.autoshrugcheck()
  if wsys.settings.autoshrugging and wsys.isClass("serpent") and wsys.cancure() then
    local saffs = wsys.shrugAffs()
    if saffs >= wsys.settings.autoshrugat and not wsys.aff.weariness and wsys.bals.shrugging and not wsys.timer.shrugwait then
      --queue the shrug here
      wsys.shrug()
    elseif saffs < wsys.settings.autoshrugat and wsys.timer.shrugwait then
      wsys.cancelshrug()
    end
  end
end

registerAnonymousEventHandler("got aff", "wsys.autoshrugcheck")
registerAnonymousEventHandler("lost aff", "wsys.autoshrugcheck")

wsys.shrugqueue = "bal"

function wsys.shrug()
  --triggers for shrugging
  enableTrigger("Shrugged")
  --shrugwait timer
  wsys.timer.shrugwait = tempTimer(5, [[wsys.timer.shrugwait = nil;disableTrigger("Shrugged")]])
  --queue the shrug
  wsys.dofreefirst("shrugging")
  wsys.shrugqueue = wsys.selectDofreeQueue()

end


function wsys.cancelshrug()
  --remove 'shrugging' from dofree queue.
  --we used DOFREEFIRST, it'll always be at #1
  --so just replace the #1 of rememberedQueue (eq or bal) with nothing!
  if wsys.timer.shrugwait then
    --kill the timer and nil it
    killTimer(tostring(wsys.timer.shrugwait))
    wsys.timer.shrugwait = nil
    --disable shrugging triggers
    disableTrigger("Shrugged")
    --remove from queue via hold breath
    send("queue replace " .. wsys.shrugqueue .. " 1 hold breath")
  end

end

local shrugprompt = false

function wsys.shrugged()
  if wsys.timer.shrugwait and not wsys.lifevision then
    wsys.cure = "shrugging"
    killTimer(tostring(wsys.timer.shrugwait))
    wsys.timer.shrugwait = nil
    wsys.lostBal("shrugging", 10.5)
    if shrugprompt then killTrigger(tostring(shrugprompt)) end
    shrugprompt = tempLineTrigger(1, 1, [[if isPrompt() then wsys.emptyshrug() end]])
    disableTrigger("Shrugged")
  end
end


function wsys.emptyshrug()
  if wsys.timer.shrugwait then
    disableTrigger("Shrug")
    killTimer(tostring(wsys.timer.shrugwait))
    wsys.timer.shrugwait = nil
    for k,v in pairs(wsys.tb.cures.shrugging) do
      if wsysf.affs[v] then
        wsysf.core.debug.print(2, "Empty shrug should clear ".. v.."?")
      end
      disableTrigger(string.title(v) .. " -")
    end
  end
end

function wsys.shrugbalgained()
  wsys.gotBal("shrugging")
  wsys.lockqueue()
end

function wsys.shruggedoffbal()
  if wsys.timer.shrugwait then killTimer(tostring(wsys.timer.shrugwait)) end
  wsys.timer.shrugwait = nil
  wsys.lostBal("shrugging", 10)
end

function wsys.shrugfail()
  if wsys.timer.shrugwait then
    killTimer(tostring(wsys.timer.shrugwait))
    wsys.timer.shrugwait = nil
    wsys.affadd("weariness")
  end
end


function wsys.shrugAffs()
  local c = 0

  if wsys.aff.addiction then c = c + 1 end
  if wsys.aff.agoraphobia then c = c + 1 end
  if wsys.aff.anorexia then c = c + 1 end
  if wsys.aff.asthma then c = c + 1 end
  if wsys.aff.carm then c = c + 1 end
  if wsys.aff.claustrophobia then c = c + 1 end
  if wsys.aff.cleg then c = c + 1 end
  if wsys.aff.clumsiness then c = c + 1 end
  if wsys.aff.confusion then c = c + 1 end
  if wsys.aff.brokenrightleg then c = c + 1 end
  if wsys.aff.darkshade then c = c + 1 end
  if wsys.aff.dissonance then c = c + 1 end
  if wsys.aff.dizziness then c = c + 1 end
  if wsys.aff.epilepsy then c = c + 1 end
  if wsys.aff.generosity then c = c + 1 end
  if wsys.aff.haemophilia then c = c + 1 end
  if wsys.aff.hallucinations then c = c + 1 end
  if wsys.aff.healthleech then c = c + 1 end
  if wsys.aff.hypersomnia then c = c + 1 end
  if wsys.aff.hypochondria then c = c + 1 end
  if wsys.aff.impatience then c = c + 1 end
  if wsys.aff.lethargy then c = c + 1 end
  if wsys.aff.loneliness then c = c + 1 end
  if wsys.aff.lovers then c = c + 1 end
  if wsys.aff.justice then c = c + 1 end
  if wsys.aff.manaleech then c = c + 1 end
  if wsys.aff.masochism then c = c + 1 end
  if wsys.aff.nausea then c = c + 1 end
  if wsys.aff.pacified then c = c + 1 end
  if wsys.aff.paralysis then c = c + 1 end
  if wsys.aff.paranoia then c = c + 1 end
  if wsys.aff.peace then c = c + 1 end
  if wsys.aff.recklessness then c = c + 1 end
  if wsys.aff.scytherus then c = c + 1 end
  if wsys.aff.sensitivity then c = c + 1 end
  if wsys.aff.shivering then c = c + 1 end
  if wsys.aff.shyness then c = c + 1 end
  if wsys.aff.slickness then c = c + 1 end
  if wsys.aff.stupidity then c = c + 1 end
  if wsys.aff.vertigo then c = c + 1 end

  return c
end




