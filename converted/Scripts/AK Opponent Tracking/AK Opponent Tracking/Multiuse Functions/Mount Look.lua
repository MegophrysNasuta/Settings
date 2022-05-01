
function ak.MountLook()
	enableTrigger("Look Prompt")
	if WhoHereTable and not table.contains(WhoHereTable,target) then return end
	ak.lookmountedupdate = true
	ak.mountedcheck = target
	if ak.lookmounted then killTrigger(ak.lookmounted) end
	if ak.lookmountedtwo then killTrigger(ak.lookmountedtwo) end
  if ak.lookmountedthree then killTrigger(ak.lookmountedthree) end
  if ak.lookmountedfour then killTrigger(ak.lookmountedfour) end
	ak.lookmounted = tempRegexTrigger(ak.mountedcheck.."(?: |.*)is here.",[[
		ak.MountLookUnMounted()
	]])
	ak.lookmountedtwo = tempRegexTrigger(ak.mountedcheck.."(?: |.*)flows ever onwards.",[[
		ak.MountLookUnMounted()
	]])
	ak.lookmountedthree = tempRegexTrigger(ak.mountedcheck.."(?: |.*)\'s imposing form looms.",[[
		ak.MountLookUnMounted()
	]])
  	ak.lookmountedfour = tempRegexTrigger(ak.mountedcheck.."(?: |.*)towers here, clad in skin of living stone.",[[
		ak.MountLookUnMounted()
	]])
end

function ak.MountLookPrompt()
	disableTrigger("Look Prompt")
	ak.GHLookPrompt()
	ak.submergedLookPrompt()
	ak.FloodLookPrompt()
  ak.distortionLookPrompt()
	if WhoHereTable and not table.contains(WhoHereTable,target) then return end
	if ak.mounted == ak.lookmountedupdate then return end
	ak.mounted = ak.lookmountedupdate
	if ak.lookmounted then killTrigger(ak.lookmounted) end
	if ak.lookmountedtwo then killTrigger(ak.lookmountedtwo) end
	if ak.lookmountedthree then killTrigger(ak.lookmountedthree) end
  if ak.lookmountedfour then killTrigger(ak.lookmountedfour) end
	ak.lookmounted = nil
	ak.lookmountedtwo = nil
	ak.lookmountedthree = nil
	ak.scoreup(target)
end

function ak.MountLookUnMounted()
	if ak.lookmounted then killTrigger(ak.lookmounted) end
	if ak.lookmountedtwo then killTrigger(ak.lookmountedtwo) end
	if ak.lookmountedthree then killTrigger(ak.lookmountedthree) end
  if ak.lookmountedfour then killTrigger(ak.lookmountedfour) end
	ak.lookmountedupdate = false
end
