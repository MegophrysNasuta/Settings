function venomToAff(venom)
  local aff_name = venom_conversion[venom]
  if (aff_name) then
    if (type(aff_name) == "function") then
        return aff_name()
    else
        return aff_name
    end
  else
    return venom
  end
end

function affToVenom(aff)
  if affliction_conversion[aff] ~= nil then
    return affliction_conversion[aff]
  else
    return aff
  end
end

function sensiReturn()
	if tarAff("undeaf") then
		return "sensitivity"
	else 
		return "undeaf"
	end
end

function eptethReturn()
	if tarAff("lepteth") then
		return "repteth"
	else
		return "lepteth"
	end
end

function epsethReturn()
	if tarAff("lepseth") then
		return "repseth"
	else
		return "lepseth"
	end
end



affliction_conversion =
  {
    paralysis = "Curare",
    slickness = "Gecko",
    sleep = "Delphinium",
    addiction = "Vardrax",
    nausea = "Euphorbia",
    darkshade = "Darkshade",
    haemophilia = "Notechis",
    stupidity = "Aconite",
    dizziness = "Larkspur",
    shyness = "Digitalis",
    clumsiness = "Xentio",
    sensitivity = "Prefarar",
    weariness = "Vernalius",
    recklessness = "Eurypteria",
    anorexia = "Slike",
    voyria = "Voyria",
    asthma = "Kalmia",
		disloyalty = "Monkshood",
		lepteth = "epteth",
		repteth = "epteth",
		lepseth = "epseth",
		repseth = "epseth"
  }
venom_conversion =
  {
    Curare = "paralysis",
    Gecko = "slickness",
    Vardrax = "addiction",
    Euphorbia = "nausea",
    Darkshade = "darkshade",
    Notechis = "haemophilia",
    Aconite = "stupidity",
    Larkspur = "dizziness",
    Delphinium = "sleep",
    Digitalis = "shyness",
    Xentio = "clumsiness",
    Prefarar = function () return sensiReturn() end,
		Sensitivity = function () return sensiReturn() end,
    Vernalius = "weariness",
    Eurypteria = "recklessness",
    Slike = "anorexia",
    Voyria = "voyria",
    Kalmia = "asthma",
    Paralyse = "paralysis",
    Sonfusion = "confusion",
    Dizzy = "dizziness",
		Monkshood = "disloyalty",
		hearing = function () return sensiReturn() end,
		--lepteth = "epteth",
		--repteth = "epteth",
		epteth = function () return eptethReturn() end,
		epseth = function () return epsethReturn() end
		}
