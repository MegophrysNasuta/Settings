-- herbsout table
wsys.herbsout = {

 ["antimony"] = 0,
 ["argentum"] = 0,
 ["arsenic"] = 0,
 ["aurum"] = 0,
 ["azurite"] = 0,
 ["ash"] = 0,
 ["bayberry"] = 0,
 ["bellwort"] = 0,
 ["bisemutum"] = 0,
 ["bloodroot"] = 0,
 ["calamine"] = 0,
 ["calcite"] = 0,
 ["cinnabar"] = 0,
 ["cohosh"] = 0,
 ["cuprum"] = 0,
 ["dolomite"] = 0,
 ["elm"] = 0,
 ["ferrum"] = 0,
 ["ginger"] = 0,
 ["ginseng"] = 0,
 ["goldenseal"] = 0,
 ["gypsum"] = 0,
 ["hawthorn"] = 0,
 ["kelp"] = 0,
 ["kola"] = 0,
 ["lobelia"] = 0,
 ["magnesium"] = 0,
 ["malachite"] = 0,
 ["skullcap"] = 0,
 ["valerian"] = 0,
 ["sileris"] = 0,
 ["moss"] = 0,
 ["pear"] = 0,
 ["plumbum"] = 0,
 ["potash"] = 0,
 ["quartz"] = 0,
 ["quicksilver"] = 0,
 ["realgar"] = 0,
 ["stannum"] = 0,
 ["ginger"] = 0,
 ["antimony"] = 0,

}

--parsing function for extracting herb names
function wsys.returnHerbName(s)
  for k,v in pairs(wsys.herbsout) do
    local pattern = "%W("..k..")"
    local theMatch = string.match(s, pattern)

  --check if pattern matched something (result is not nil)
    if theMatch then return theMatch end
  end
  return false
end

--get a number from a string
function wsys.extractNumberFromString(s)
  return tonumber(string.match(s, "(%d+)"))
end

--never change these variables
wsys.addedHerbID = 1
wsys.removedHerbID = 2


--outrift herbs missing
function wsys.outrqueue()
 if wsys.cancure() and wsys.outriftcheck() and not wsys.timer.outrqueuewait then
  if wsys.timer.outrqueuewait then killTimer(wsys.timer.outrqueuewait) end
  wsys.timer.outrqueuewait = tempTimer(wsys.myPing() * 1.5, [[wsys.timer.outrqueuewait = nil]])

  for k,v in pairs(wsys.herbsout) do
   if wsys.keepout[k] and v < wsys.keepout[k] then
    wsys.outr(k, wsys.keepout[k] - v)    
   end -- if
  end -- for
 end -- if
end -- func

function wsys.outr(herb, num)
  wsys.salviaSend("outr " .. num .. " " .. herb)
end -- func

--outrifted function as blind and no mindseye failsafe
function wsys.outrifted(herb, num)
  local herbName = wsys.returnHerbName(herb)
  local amount = tonumber(num)

  if herbName then
    wsys.herbsout[herbName] = wsys.herbsout[herbName] + amount
  end
end

--serverside trigger outrift function
function wsys.serversideOutrift(herb)
  local herbName = herb
  if herbName == "irid" then herbName = "moss" end
  wsys.herbsout[herbName] = 0
  wsys.outrqueue()
end

function wsys.inralld()
  wsys.resetherbsoutTable()
  if wsys.timer.inrafailsafe then killTimer(wsys.timer.inrafailsafe) end
  wsys.timer.inrafailsafe = tempTimer(1+wsys.myPing(), [[wsys.timer.inrafailsafe = nil;wsys.outrqueue()]])
end

function wsys.resetherbsoutTable()
  wsys.herbsout = {

 ["antimony"] = 0,
 ["argentum"] = 0,
 ["arsenic"] = 0,
 ["aurum"] = 0,
 ["azurite"] = 0,
 ["ash"] = 0,
 ["bayberry"] = 0,
 ["bellwort"] = 0,
 ["bisemutum"] = 0,
 ["bloodroot"] = 0,
 ["calamine"] = 0,
 ["calcite"] = 0,
 ["cinnabar"] = 0,
 ["cohosh"] = 0,
 ["cuprum"] = 0,
 ["dolomite"] = 0,
 ["elm"] = 0,
 ["ferrum"] = 0,
 ["ginger"] = 0,
 ["ginseng"] = 0,
 ["goldenseal"] = 0,
 ["gypsum"] = 0,
 ["hawthorn"] = 0,
 ["kelp"] = 0,
 ["kola"] = 0,
 ["lobelia"] = 0,
 ["magnesium"] = 0,
 ["malachite"] = 0,
 ["skullcap"] = 0,
 ["valerian"] = 0,
 ["sileris"] = 0,
 ["moss"] = 0,
 ["pear"] = 0,
 ["plumbum"] = 0,
 ["potash"] = 0,
 ["quartz"] = 0,
 ["quicksilver"] = 0,
 ["realgar"] = 0,
 ["stannum"] = 0,
 ["ginger"] = 0,
 ["antimony"] = 0,

}
end

