function backtrack(aff)
  if not tarAff(aff) then
    for k, v in pairs(lastcured) do
      if v == aff and (curetime[k] + 3 >= getEpoch()) then
        Cure(k)
        break
      end
    end
    Tragedy.noshowAdd(aff)
  end
end

cmethods =
  {
    ["asthma"] = {"tree", "kelp"},
    ["anorexia"] = {"focus", "tree"},
    ["slickness"] = {"tree", "bloodroot", "smoke"},
    ["impatience"] = {"tree", "goldenseal"},
    ["guilt"] = {"lobelia", "tree"},
    ["spiritburn"] = {"lobelia", "tree"},
    ["tenderskin"] = {"lobelia", "tree"},
    ["stupidity"] = {"goldenseal", "tree", "focus"},
  }
	
function backtrack2(aff)
  local method = highestcuremethod(aff) --run that aff (from the above table) through a function that determines the most recently used possible curemethod for that aff
  if tarAff(aff) then --if the target has that aff
    if lastcured[method] ~= aff then --and the last thing cured by that method wasn't the aff (i.e. maybe I reapplied between things)
      if not tarAff(lastcured[method]) then --and target doesn't have the last thing I thought that method cured
        if curetime[method] then	--if that method was actually used to cure since I reset tracking
          if getEpoch() - 1 <= curetime[method] then	--if it happened within 1 second
            Tragedy.noshowAdd(lastcured[method])	--add what I assumed had been cured by the method
          end
        end
      end
    end
    Tragedy.curedaff(aff)	--cure the specific aff they can't have (ano/slick/whatever lock aff that can be tracked as cured by symptom)
  end
end


function highestcuremethod(aff)
  local m = {0, 0}
  for k, v in pairs(cmethods[aff]) do
    if curetime[v] then
      if m[1] < curetime[v] then
        m[1] = curetime[v]
        m[2] = v
      end
    end
  end
  return m[2]
end

function highestcuretime()--returns kelp or ash or w/e as index so that lastcured[highestcuretime] will return an affname
  local m = {0, 0}
  for k, v in pairs(curetime) do
    if not tarAff(lastcured[k]) then
      if m[1] < v then
        m[1] = v
        m[2] = k
      end
    end
  end
  return m[2]
end
