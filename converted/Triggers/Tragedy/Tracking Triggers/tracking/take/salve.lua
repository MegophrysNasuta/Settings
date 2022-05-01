if isTarget(matches[2]) and not illusion then 
	if matches[3] == "body" or matches[3] == "skin" then
    if tarAff("ablaze") then
      Tragedy.curedaff("ablaze")
    else
		  Tragedy.curedaff("anorexia")
    end
	--else
		--salve_track.applied(matches[3])
  elseif matches[3] == "legs" then
    if tarAff("brokenleftleg") and tarAff("brokenrightleg") then
      Tragedy.curedaff("brokenleftleg")
    elseif tarAff("brokenleftleg") and not tarAff("brokenrightleg") then
      Tragedy.curedaff("brokenleftleg")
    elseif tarAff("brokenrightleg") and not tarAff("brokenleftleg") then
      Tragedy.curedaff("brokenrightleg")
    elseif tarAff("damagedleftleg") and tarAff("damagedrightleg") then
      tempTimer(3.5, [[Tragedy.curedaff("damagedleftleg")]])
      tempTimer(3.5, [[Tragedy.noshowAdd("brokenleftleg")]])
    elseif tarAff("damagedleftleg") and not tarAff("damagedrightleg") then
      tempTimer(3.5, [[Tragedy.curedaff("damagedleftleg")]])
      tempTimer(3.5, [[Tragedy.noshowAdd("brokenleftleg")]])
    elseif tarAff("damagedrightleg") and not tarAff("damagedleftleg") then
      tempTimer(3.5, [[Tragedy.curedaff("damagedrightleg")]])
      tempTimer(3.5, [[Tragedy.noshowAdd("brokenrightleg")]])
    end
	end
	backtrack2("slickness")
end
	--[[else
		curedaff("anorexia")
	end
end]]--

if gmcp.Char.Status.class == "Priest" then
  if tarAff("tenderskin") then
    tarMana = tarMana-8
  end
end
