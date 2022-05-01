function wsys.tree()
	if not wsys.timer.treedelay then 
	-- Bit of a hack. Calling queue add touch tree twice will touch it once, then again after 
	-- regaining tree balance, by which point you really no longer need to touch it. 
		send("curing queue remove touch tree")
		send("curing queue add touch tree")
		wsys.timer.treedelay = tempTimer( 4, function() wsys.timer.treedelay = nil end  )
	end
end -- func

if wsys.events.tree_para_check then killAnonymousEventHandler( wsys.events.tree_para_check ) end
wsys.events.tree_para_check = registerAnonymousEventHandler( "got aff",
  function(event, affliction)
		if wsys.timer.treedelay and event == "got aff" and affliction == "paralysis" then
			killTimer( wsys.timer.treedelay )
			wsys.timer.treedelay = nil
			send("curing queue remove touch tree")
		end
	end)

local treeprompt = false

function wsys.treed(empty)
if (wsys.timer.treewait or forced or wsys.timer.snap) and not wsys.lifevision then
 wsys.timer.treewait = nil
 wsys.treesub()
 if wsys.aff.slimeobscure then
   wsys.lostBal("tree", wsys.settings.treebaltime + 10)
 else
   wsys.lostBal("tree", wsys.settings.treebaltime)
 end
 if not empty then
  wsys.cure = "tree"
  if treeprompt then killTrigger(tostring(treeprompt)) end
  if not wsys.aff.blackout then
   if not wsys.timer.snap then
    treeprompt = tempLineTrigger(1,1, [[if isPrompt() then wsys.emptytree() end]])
   end -- if
  end -- if
 end -- if
 if wsys.timer.snap then
  killTimer(tostring(wsys.timer.snap))
  wsys.timer.snap = nil
 end -- if
end -- if
end -- func

function wsys.treebal(event, bal)
  if event == "got bal" and bal == "tree" then
    cecho("\n<green>You may TREE again\n")
    wsys.lockqueue()
  end
end

registerAnonymousEventHandler("got bal", "wsys.treebal")

function wsys.emptytree()
 for k,v in pairs(wsys.tb.cures.tree) do
   wsys.predicted[v] = nil
   if wsysf.affs[v] then
     wsysf.core.debug.print(2, "Empty tree should clear ".. v.."?")
   end
  disableTrigger(string.title(v) .. " -")
 end -- for
 wsys.pairscheck("tree")
 wsys.cure = nil
end -- func

function wsys.treeAffs()
  local c = 0
	
	for _,aff in ipairs(wsys.tb.cures.tree) do
		c = c + wsysf.affv[aff]
	end

  return c
end
