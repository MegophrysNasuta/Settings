xtarget = xtarget or {}
xtarget.name = xtarget.name or nil
xtarget.rebounding = xtarget.rebounding or true
xtarget.shield = xtarget.shield or false
xtarget.afflictions = xtarget.afflictions or {}
illusion = illusion or false

function amIinParty()
  local i
  for i = 1, #gmcp.Comm.Channel.List do
    if gmcp.Comm.Channel.List[i].name == "party" then
      return true
    end
  end
  return false
end

function setTarget(who)
	xtarget.name = string.lower(xtarget.name)
  Tragedy.echo("<light_blue> Target is set to: <red>"..xtarget.name)
  xtarget.rebounding = true
  xtarget.shield = false
	resetTracking()
  xtarget.afflictions = {}
	Tragedy.hits = {}
	venom1 = nil
	venom2 = nil
end

function isTarget(p)
	if xtarget.name then
		return string.starts(p, string.title(xtarget.name))
	end
end
