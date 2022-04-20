Tragedy = Tragedy or {}
Tragedy.hits = Tragedy.hits or {}
function Tragedy.echo(what)
	--cecho("\n<dark_violet>[<DarkGoldenrod>Tragedy<dark_violet>]<white>:"..what)
end


function Tragedy.Cure(ctype)
	if tarAff("aeon") and table.contains(curetables[ctype], "asthma") and tarAff("asthma") then 
			table.remove(xtarget.afflictions, table.index_of(xtarget.afflictions, "asthma")) 
			Tragedy.echo("<orange> CURED ASTHMA")
			lastcured[ctype] = "asthma"
			curetime[ctype] = getEpoch()
	else
		for i = 1, #curetables[ctype] do
			if tarAff(curetables[ctype][i]) then
				table.remove(xtarget.afflictions, table.index_of(xtarget.afflictions, curetables[ctype][i]))
				Tragedy.echo("<orange> CURED " .. string.upper(curetables[ctype][i]))
				lastcured[ctype] = curetables[ctype][i]
				curetime[ctype] = getEpoch()
				break
			end
		end
	end
end


function Tragedy.curedaff(aff)
	if tarAff(aff) then
		table.remove(xtarget.afflictions, table.index_of(xtarget.afflictions, aff))
		Tragedy.echo("<orange> CURED " .. string.upper(aff))
	end
end

function Tragedy.noshowAdd(aff)
	if venom_conversion[aff] then
		local affname = venomToAff(aff)
		if not tarAff(affname) then
			table.insert(xtarget.afflictions, affname)
			Tragedy.echo("<red> (Party)<medium_orchid> AFFLICTED "..string.upper(affname))
		end
	else
		if not tarAff(aff) then
			table.insert(xtarget.afflictions, aff)
			Tragedy.echo("<red> (Party)<medium_orchid> AFFLICTED "..string.upper(aff))
		end
	end
end

function Tragedy.TrackerAdd(aff)
	if venom_conversion[aff] then
		local affname = venomToAff(aff)
		if not tarAff(affname) then
      table.insert(xtarget.afflictions, affname)
      if amIinParty() then
				--send("pt " .. affname .. " on " .. string.title(xtarget.name))
			end
			Tragedy.echo("<medium_orchid> AFFLICTED "..string.upper(affname))
		end
	else
		if not tarAff(aff) then
			table.insert(xtarget.afflictions, aff)
			 if amIinParty() then
        --send("pt " .. aff .. " on " .. string.title(xtarget.name))
      end
			Tragedy.echo("<medium_orchid> AFFLICTED "..string.upper(aff))
		end
	end
end
		
function tarAff(aff)
  return table.contains(xtarget.afflictions, aff)
end
