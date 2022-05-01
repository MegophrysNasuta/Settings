

talisman = talisman or {}

talisman.settings = talisman.settings or {}
talisman.settings.color = "CadetBlue"

talisman.pieces = talisman.pieces or {}
--[[
Old structure
  greendragonheart = {
    ["1"] = 1,
    ["4"] = 1,
    ["2"] = 1
  }
New structure
  greendragonheart = {
    ["B"] = 3,
    ["Q"] = 1
  }
--]]


-- Unknown for when someone transfers one to us, so we can still count it, but dont need to know its total.
talisman.types = {promo="P", refine="R", quest="Q", bashing="B", unknown="U", total="T"}


talisman.help = function ()
	local name
	if gmcp then
		name = gmcp.Char.Status.name:upper()
	else
		name = "SERAGORN"
	end
	cecho("<white>USEAGE:\n")
	cecho("<white>TLIST - <reset>Displays a summary list of all known talisman pieces.\n")
	cecho("<white>TCOMPLETE <talisman>- <reset>Splits out the required pieces and completes the given talisman\n")
	cecho("<reset>      - Example: TCOMPLETE AZATLANKNIFE\n")
	cecho("<white>TTRADE <adventurer> <piece> [<count>]\n")
	cecho("<reset>      - Used to trade <count> (defaults to 1) pieces of <piece> to <adventurer>\n")
	cecho("<reset>      - Example: TTRADE "..name.." bluedragonscale 20\n")
	cecho("<reset>      - Note: aliases only work after talisman pieces has been checked the first time.\n")
	cecho("<reset>      - After this point it should keep an accurate list of pieces automatically.\n")
	cecho("<white>TTRADE SET <adventurer> <setname>\n")
	cecho("<reset>      - Used to trade all the pieces required to complete <set> to <adventurer>\n")
	cecho("<reset>      - Example: TTRADE SET DRAGON "..name.."\n")
	cecho("<white>TTRADE TALISMAN <adventurer> <talismanname>\n")
	cecho("<reset>      - Used to trade all the pieces required to complete a specific <talisman> to <adventurer>\n")
	cecho("<reset>      - Example: TTRADE TALISMAN TRANSOCEANIC "..name.."\n")
	cecho("\n<white>IMPORTANT: No validation is performed on trading complete sets/talismans.\n")
	cecho("<white>This means if you trade an incomplete set you will send some but not all of the pieces.\n")
end

talisman.echo = function (...)
	cecho(string.format("<%s>(Talisman): %s\n", talisman.settings.color, string.format(...)))
end

talisman.deleteLineP = function ()
  if gss then 
    gss.deleteLineP()
  elseif svo then
    svo.deleteLineP()
  end
end

talisman.reset = function ()
	talisman.pieces = {}
end

-- Function to standardize the names because of the 20 char limit.
talisman.getkey = function (longname)
	return talisman.names[longname]
end

-- Functions to translate level to count and visa versa
talisman.counttolevel = function (level)
	if (tonumber(level) or 0) <= 0 then
		return 1
	else
		return (math.log(tonumber(level))/math.log(2))+1
	end
end

talisman.leveltocount = function (level)
	return math.pow(2, (tonumber(level) or 0)-1)
end

-- type checking for when we want to specifically send a type of talisman piece (promo, refined, etc)
talisman.ischecktype = function (type, typeflag)
	if not typeflag then 
		return true
	else
		return typeflag==type
	end	
end

-- Set activity checks (so we dont display a set in the list that we have nothing of)
talisman.setisactive = function (set)
	for i,_ in pairs(talisman.sets[set]) do
		if talisman.talismanisactive(i) then
			return true
		end
	end
	return false
end

talisman.talismanisactive = function (talismanname)
	for k,d in pairs(talisman.info[talismanname]) do
		if talisman.pieces[k] and (tonumber(talisman.pieces[k][talisman.types.total]) or 0)>0 then
			return true
		end
	end
	return false
end




-- Functions to help manage and find our pieces
talisman.getcount = function (piecename, type)
	local count = 0
	local gettype = type or talisman.types.total
	if not talisman.pieces[piecename] then
		return 0
	end
	return talisman.pieces[piecename][gettype] or 0
end

talisman.autosplit = function (piecename, size)
	-- only split pieces > level 1 obviously..
	if (tonumber(size) or 0)<=1 then return end
	send(string.format("talisman split %s %s", piecename, size))
	if (tonumber(size) or 0)>2 then
		-- recursively work our way down.. we just got 2 level (size-1) pieces.. split them
  	talisman.autosplit(piecename, (tonumber(size)-1))
  	talisman.autosplit(piecename, (tonumber(size)-1))
	end
end

-- Function to combine pieces required to get a specific level piece.
talisman.make = function (piecename, level)
	-- note this can fail currently because we cant control the talisman combine type so it cant combine promo with refined, etc.
	if (tonumber(level) or 0) <= 1 then return true end
	if (tonumber(level) or 0) > 2 then
		-- if we need a level 4 piece.. we need 2 level 3 pieces first..
		talisman.make(piecename, (tonumber(level)-1))
    talisman.make(piecename, (tonumber(level)-1))
	end
	-- to make a level 4 piece, we combine 2 level 3 pieces..
	send(string.format("talisman combine %s %s", piecename, tonumber(level)-1))
	return true
end

talisman.add = function (piecename, level, count, type)
	local name = talisman.lookup[piecename:cut(20)]
	local mytype = type or talisman.types.unknown
	if not name then 
		cecho("<red>***")
		return
	end

	if (tonumber(level) or 0) > 1 then
		-- auto split things on the way in..
		for i=1, (tonumber(count) or 1) do
			talisman.autosplit(piecename, tonumber(level))
		end
	end

	talisman.pieces[name] = talisman.pieces[name] or {}
	talisman.pieces[name][mytype] = talisman.pieces[name][mytype] or 0
	talisman.pieces[name][talisman.types.total] = talisman.pieces[name][talisman.types.total] or 0
	
	talisman.pieces[name][mytype] = talisman.pieces[name][mytype] + talisman.leveltocount(level)*(tonumber(count) or 1)
	talisman.pieces[name][talisman.types.total] = talisman.pieces[name][talisman.types.total] + talisman.leveltocount(level)*(tonumber(count) or 1)
end

talisman.remove = function (piecename, level, count, type)
	if not talisman.pieces[piecename] then return end
	if not talisman.pieces[piecename][talisman.types.total] then 
		talisman.echo("Attempt to remove pieces we dont think we have for %s!", piecename)
		return -- we dont know if we have those pieces.. bail
	end
	-- calculate the true quantity we're removing..
	local count = tonumber(talisman.leveltocount((tonumber(level) or 1)) * (tonumber(count) or 1))

  if (tonumber(talisman.pieces[piecename][talisman.types.total]) or 0) <= count then
		-- we dont think we have enough in total, so just remove them all
		talisman.pieces[piecename]={}
		talisman.pieces[piecename][talisman.types.total] = 0
	else
  	-- we think we have enough.. remove from total, if theres any question where they came from, add to unknown
		if table.size(talisman.pieces[piecename])>2 then
			-- we always have a T and P or R item, if we have a T, P AND R (or Q) then it indicates some confusion or doubt..
			local newtotal = talisman.pieces[piecename][talisman.types.total]-count
			talisman.pieces[piecename] = {}
			talisman.pieces[piecename][talisman.types.total] = newtotal
			talisman.pieces[piecename][talisman.types.unknown] = newtotal
		else
			for i,v in pairs(talisman.pieces[piecename]) do
				talisman.pieces[piecename][i] = tonumber(v)-count
			end
		end
	end
end





-- Logic to complete talismans.
talisman.complete = function (talismanname)
	if not talisman.cancomplete(talismanname) then
		talisman.echo(string.format("Cannot complete talisman %s, pieces missing.", talismanname))
		return
	end

	for k,d in pairs(talisman.info[talismanname]) do
		local required = (math.log(d.required)/math.log(2))+1
		if math.floor(required)==required then
  			if talisman.make(k, required) then
	  			talisman.echo(string.format("Error: Could not make level %d of %s, please check talisman pieces to correct stored data.", (tonumber(required) or -1), k))
  			return
  		end
			talisman.remove(k, required, 1)
		else
			-- if required is 3, we cant combine this, so use 3 singles (mudbomb for example)..
			talisman.remove(k, 1, d.required)
		end
	end
	send(string.format("Talisman complete %s", talismanname))
end

talisman.cancomplete = function (talismanname)
	if not talisman.info[talismanname] then
		talisman.echo(string.format("Invalid talisman %s", talismanname))
		return false
	end

	for k,d in pairs(talisman.info[talismanname]) do
		if talisman.getcount(k) < d.required then
			-- dont have required pieces!
			return false
		end
	end
	return true
end





-- Logic for trading talismans
talisman.tradeset = function (who, set, promo)
	if not talisman.sets[set] then
		talisman.echo(string.format("Invalid talisman set %s", set))
		return
	end
	for i,_ in pairs(talisman.sets[set]) do
		talisman.tradetalisman(who, i, promo)
	end
end

talisman.tradetalisman = function (who, talismanname, promo)
	if not talisman.info[talismanname] then
		talisman.echo(string.format("Invalid talisman %s", talismanname))
		return
	end

	for k,d in pairs(talisman.info[talismanname]) do
		if promo then
			talisman.trade(who, k, d.required)
		else
			talisman.trade(who, k, d.required)
		end
	end
end

talisman.typetolong = function (typecode)
	if typecode == talisman.types.promo then
		return "promo"
	elseif typecode == talisman.types.refine then
		return "refine"
	elseif typecode == talisman.types.quest then
		return "quest"
	else
		return ""
	end
end

talisman.trade = function (who, piecename, quantity, type)
	local count = talisman.getcount(piecename)
	if count<quantity then
		talisman.echo(string.format("Only %d available of %s ", count, piecename))
		return
	end
	if count>256 then
		talisman.echo("Trade alias can only handle quantities up to 256, sorry!")
		return
	end
	local required = {}
	local remaining = quantity
	local index = 9
	while index>0 and remaining>0 do
		if remaining>=(2^(index-1)) then
			required[tostring(index)]=true
			remaining=remaining-(2^(index-1))
		end
		index=index-1
	end
	for i,v in pairs(required) do
		if not talisman.make(piecename, tonumber(i)) then
			talisman.echo(string.format("Error: Could not make level %d of %s", tonumber(i), piecename))
			return
		else
			if not price then
				send(string.format("Talisman trade piece %s %d %s to %s for nothing", piecename, tonumber(i), talisman.typetolong(type), who))
			else
				send(string.format("Talisman trade piece %s %d %s to %s for %d", piecename, tonumber(i), talisman.typetolong(type), who))
			end
			talisman.remove(piecename, tonumber(i), 1)
		end
	end
end






-- Display and formatting functions

-- Highlighters to announce our counts when we get new pieces..
talisman.announce = function (piecename, size, type)
	local count = talisman.getcount(piecename, type)
	if size >= 0 then
		count = count + 2^(math.abs(tonumber(size))-1)
	else
		count = count - 2^(math.abs(tonumber(size))-1)
	end
	cecho(string.format("<%s> (Count: %d)", talisman.settings.color, count))
end

talisman.rightpad = function (data, length)
	return string.cut(string.format("%s%s", (data or "?"), string.rep(" ", length)), length)
end

talisman.highlight = function ()
	selectCurrentLine()
	fg("gold")
	resetFormat()
end

talisman.summary = function (setname)
	local talismangrandtotal = 0
	if setname then
		if not talisman.setisactive(setname) then
			talisman.echo(string.format("Set Inactive %s", setname))
			return 
		end
		talisman.displayset(setname)
		return
	end
	for i,v in ipairs(talisman.setorder) do
		talisman.settotal = 0
		talisman.setspare = 0
		talisman.setrequired = 0
		if talisman.setisactive(v) then
			talisman.displayset(v)
			talismangrandtotal = talismangrandtotal + talisman.setcredittotal
		end
	end
	cecho(string.format("<white>Total Value: <red>%d (%d)<white>\n\n", talismangrandtotal,((talismangrandtotal or 0) + (tonumber(gmcp.Char.Status.boundcredits) or 0) + (tonumber(gmcp.Char.Status.unboundcredits) or 0))))
end

talisman.displayset = function (set)
	if not talisman.sets[set] then
		talisman.echo(string.format("Invalid talisman set for output %s", set))
		return
	end

	talisman.settotal = 0
	cechoLink(string.format("<white>%s Set<reset>\n", set:title()), [[printCmdLine("ttrade set ]]..(target or "<person>").." "..set..[[")]], "Click to trade complete set", true)
	cecho(string.format("<white>%s<reset>\n", string.rep("-", string.len(set)+4)))

	talisman.setcredittotal = 0	
	if talisman.setformat[set] and talisman.setformat[set].order then
	-- echo the header..
		for _,v in ipairs(talisman.setformat[set].order) do
			if talisman.talismanisactive(v) then
				talisman.displaysetdetail(set, v, talisman.sets[set][v])
			end
		end
	else
		for i,v in pairs(talisman.sets[set]) do
			if talisman.talismanisactive(i) then
				talisman.displaysetdetail(set, i, v)
			end
		end
	end
	if talisman.setrequired > 0 then
		cecho(string.format("<white>Total: %d of %d common (%d%% plus %d spare) <red>(%s)<white>\n\n", talisman.settotal, talisman.setrequired, math.floor(talisman.settotal*100/talisman.setrequired), talisman.setspare, (talisman.setcredittotal or 0)))
	end
end

talisman.displaysetdetail = function (set, talismanname, talismandata)

	local talismanfull, talismancount
	talisman.talismantotal = 0
	talisman.talismanspare = 0
	talisman.talismanrequired = 0
	cechoLink(string.format("<%s>%s", ((talismandata and talismandata.color) or talisman.settings.color), talisman.rightpad(talismandata.short, talisman.setformat[set].titlewidth)), [[printCmdLine("ttrade talisman ]]..(target or "<person>").." "..talismanname..[[")]], "Click to trade complete talisman", true)
	talismanfull, talismancount = talisman.displaytalisman(talismanname, set, talismandata.order)
	talisman.settotal = talisman.settotal + talisman.talismantotal
	talisman.setspare = talisman.setspare + talisman.talismanspare
	talisman.setrequired = talisman.setrequired + talisman.talismanrequired
	if talisman.talismanrequired-talisman.talismantotal>0 then
		cecho(string.format("<CadetBlue>(%d%%)<reset>", math.floor(talisman.talismantotal*100/talisman.talismanrequired)))
	else
		cecho("<green>(100%)<reset>")
	end
	if talisman.setformat[set].value then
		talisman.credittotal = (talismanfull*talismandata.tradein) + ((talismancount - (talismanfull*4)) * talismandata.redeem)
		talisman.setcredittotal = (talisman.setcredittotal or 0) + (talisman.credittotal or 0)
		cecho(string.format("<red> %s %s %s <white>(%s %s)", talismanfull, talismancount, talisman.credittotal, (talismandata.tradein or 0), (talismandata.redeem or 0)))
	end
	cecho("\n")
end

talisman.displaytalisman = function (talismanname, set, order)
	local temp = 0
	local min = 99
	local count = 0

	if not talisman.info[talismanname] then
		talisman.echo(string.format("Invalid talisman for output %s", talismanname))
		return
	end
	if not order then
		-- unsorted..
		for k,d in pairs(talisman.info[talismanname]) do
			temp = talisman.displayitem(k, d, set)
			if temp < min then
				min = temp
			end
			count = count + temp
		end
	else
		for _,d in ipairs(order) do
			temp = talisman.displayitem(d, talisman.info[talismanname][d], set)
			if temp < min then
				min = temp
			end
			count = count + temp
		end
	end
	return min, count
end

talisman.getdisplaycolor = function (name, count, required)
	if not talisman.pieces[name] then
		return "CadetBlue"
	elseif count >= required then
		if (tonumber(talisman.pieces[name][talisman.types.unknown]) or 0)>0 then
			return "orange_red"
		elseif (tonumber(talisman.pieces[name][talisman.types.refine]) or 0)>0 and (tonumber(talisman.pieces[name][talisman.types.promo]) or 0)>0 then
			return "yellow"
		elseif (tonumber(talisman.pieces[name][talisman.types.refine]) or 0)>0 then
			return "GreenYellow"
		else
			return "green"		
		end
	else
		if (tonumber(talisman.pieces[name][talisman.types.unknown]) or 0)>0 then
			return "red"
		elseif (tonumber(talisman.pieces[name][talisman.types.refine]) or 0)>0 then
			return "medium_orchid"
		else
			return "CadetBlue"
		end
	end		
end

talisman.displayitem = function (name, data, set)
	local count = talisman.getcount(name)
	local color = talisman.getdisplaycolor(name, count, data.required)
	if count>=data.required then
		cechoLink(string.format("<%s>%s", color, talisman.rightpad(string.format("%s(%d)", string.cut(data.short,talisman.setformat[set].cellwidth), count), talisman.setformat[set].cellwidth+5)), [[printCmdLine("ttrade ]]..(target or "<person>").." "..name..[[")]], "Click to trade", true)
		talisman.talismantotal = talisman.talismantotal + data.required -- (dont include spares in our total required)
		talisman.talismanspare = talisman.talismanspare + count - data.required
	else
		cechoLink(string.format("<%s>%s", color, talisman.rightpad(string.format("%s(%d)", string.cut(data.short,talisman.setformat[set].cellwidth), count), talisman.setformat[set].cellwidth+5)), [[printCmdLine("ttrade ]]..(target or "<person>").." "..name..[[")]], "Click to trade", true)
		talisman.talismantotal = talisman.talismantotal + count -- (dont include spares in our total required)
	end
	talisman.talismanrequired = talisman.talismanrequired + data.required
	return math.floor(count/data.required)
end


-- This just helps us deal with the fact that some pieces have a string thats to long (20 char limit on the talisman piece list)..
talisman.createlookup = function ()
	talisman.lookup ={}
	for i,v in pairs(talisman.sets) do
		for k,d in pairs(v) do
			for a,b in ipairs(d.order) do
				talisman.lookup[b:cut(20)] = b
			end
		end
	end
end

talisman.createlookup()

