wsys.dofreequeue = wsys.dofreequeue or {}
wsys.dofreeSub = wsys.dofreeSub or {}
wsys.doqueue = wsys.doqueue or {}
wsys.doOnce_list = wsys.doOnce_list or {}

wsys.doSub = wsys.doSub or ""
wsys.dorSub = wsys.dorSub or ""

wsys.doqueued = false

local function expand_command( str )
  str = str:gsub( "^ONCE: ", "")
  return str:gsub( "$(%w+)", 
    function( n )
		  local expand_to = wsys.overrides.doqueue.expand[ n ]
      return expand_to and expand_to() or n
		end)
end

local function eval_command( element )
  if element.label and wsys.doOnce_list[element.label] then
    return wsys.doOnce_list[element.label]()
  else
	  return expand_command( element.ac )
  end
end

--use / to seperate multiple commands
--ex. wsys.dofreeadd("g gold/put gold in "..myPack)
function wsys.dofreeadd(ac, silent)
  local dofreequeuesize = #wsys.dofreequeue
  if dofreequeuesize < 7 then
      send("setalias dofree"..tostring(dofreequeuesize+1).." "..ac, not silent)
      send("queue add " .. wsys.selectDofreeQueue() .. " dofree"..tostring(dofreequeuesize+1), not silent)
      wsys.dofreequeue[dofreequeuesize+1] = ac
  else
    cecho("\n<red>DOFREE QUEUE FULL! Couldn't add "..ac)
  end
end

function wsys.dofreefirst(ac, silent)
  local dofreequeuesize = #wsys.dofreequeue
  if dofreequeuesize < 7 then
      send("setalias dofree"..tostring(dofreequeuesize+1).." "..ac, not silent)
      send("queue prepend " .. wsys.selectDofreeQueue() .. " dofree"..tostring(dofreequeuesize+1), not silent)
      wsys.dofreequeue[dofreequeuesize+1] = ac
  else
    cecho("\n<red>DOFREE QUEUE FULL! Couldn't add "..ac)
  end
end

function wsys.selectDofreeQueue()
  if wsys.bals.b and wsys.bals.e then
    return "bal"
  elseif wsys.bals.b and not wsys.bals.e then
    return "eq"
  elseif not wsys.bals.b and wsys.bals.e then
    return "bal"
  elseif not wsys.bals.b and not wsys.bals.e then
    return "bal"
  end
end

function wsys.dofreeremove(n)
  wsys.dofreequeue[tonumber(n)] = nil
end

function wsys.dofreeclear()
  wsys.dofreequeue = {}
end

--queue[i] = { element = "action", priority = [1-N] } --1 is highest priority
local default_queue_priority = 25 --arbitrary low priority. Picked this because curing/defences use 1-25
function wsys.priority_queue_insert( queue, element, priority, lifo )
  local inserted = false
  for index,item in ipairs(queue) do
    if priority < item.priority then
      -- New priority is lower than existing. Insert
      table.insert( queue, index, { element = element, priority = priority } )
      inserted = true
      break
    elseif priority == item.priority then
      --Same priority. If lifo, insert, else go until lower
      if lifo then
        table.insert( queue, index, { element = element, priority = priority } )
        inserted = true
        break
      end
    end
  end
  if not inserted then
    -- Add to the end
    table.insert( queue, { element = element, priority = priority } )
  end
end

function wsys.doadd(ac, priority, silent, on_run )
  wsys.priority_queue_insert( wsys.doqueue, { ac = ac, silent = silent, on_run = on_run }, priority or default_queue_priority )
  
	-- TODO: Need to check for priority?
	if not wsys.doqueue_pending then
		wsys.dosend()
  end
end
 
function wsys.dofirst(ac, priority, silent, on_run )
  wsys.priority_queue_insert( wsys.doqueue, { ac = ac, silent = silent, on_run = on_run }, priority or default_queue_priority, true )
  wsys.dosend()
end

function wsys.doOnce( label, priority, silent )
  local match_found = false
  --Check the current pending command for a match
  if wsys.doqueue_pending and wsys.doqueue_pending.element.label and wsys.doqueue_pending.element.label == label then
    --Match found. See if we need to update
    wsys.doupdate()
    match_found = true
  else
    for i,item in ipairs( wsys.doqueue ) do
      if item.element.label == label then
        match_found = true
        --TODO: Update priority?
        break
      end
    end
  end

  if not match_found then
    wsys.priority_queue_insert( wsys.doqueue, { ac = "ONCE: "..label, silent = silent, label = label }, priority or default_queue_priority, true )
    wsys.dosend()
  end
end

function wsys.doupdate()
	--Check this from aff tracking update?
  if wsys.doqueue_pending then
    local text = eval_command( wsys.doqueue_pending.element )
    if not text or #text == 0 then
      wsys.debug("\ndoupdate() Updating action! Is now empty")
      --Action is empty. Remove it and queue the next thing
      send("clearqueue eqbal", false )
      -- Make sure the next command gets sent
      wsys.dosent()
    elseif wsys.do1_eval ~= text then
      wsys.debug("\ndoupdate() Updating attack!")
      wsys.do1_eval = text
      send("setalias do1 "..wsys.do1_eval, not wsys.doqueue_pending.element.silent )
    end
  end
end

local function get_next_action()
  while #wsys.doqueue > 0 do
    local text = eval_command( wsys.doqueue[1].element )
    if text and #text > 0 then
      return text
    else
      -- action evaluated to nil or empty string. Remove it
      table.remove(wsys.doqueue, 1)
    end
  end
  return false
end

function wsys.dosend()
  wsys.debug( "dosend() - dowait = " .. ( tostring(wsys.timer.dowait) or "nil" ) )
  wsys.debug("\ndosend() - " .. #wsys.doqueue .. " queued.")
  if not wsys.paused then--or	not wsys.timer.dowait then
  local text = get_next_action()
    if text then
		if wsys.doqueued and wsys.doqueue_pending and ( wsys.do1_eval == text or wsys.doqueue_pending.priority < wsys.doqueue[1].priority ) then
			--Next element is same as pending command, or higher priority. Don't re-queue
			wsys.debug("\ndosend() returning early "..wsys.do1_eval)
			return
		end
      wsys.timer.dowait = tempTimer(wsys.myPing()*3, [[wsys.timer.dowait = nil]])
		wsys.do1_eval = text
      send("setalias do1 "..wsys.do1_eval , not wsys.doqueue[1].element.silent )
      --if wsys.doraction then
        send("clearqueue eqbal", not wsys.doqueue[1].element.silent )
      --end
      wsys.doqueued = true
      send("queue add eqbal do1", not wsys.doqueue[1].element.silent )
      local temp = wsys.doqueue[1]
      if wsys.doqueue_pending then
        --We interrupted a pending command. Add back to the list
        wsys.doqueue[1] = wsys.doqueue_pending
      else
        table.remove(wsys.doqueue, 1)
      end
      wsys.doqueue_pending = temp
    elseif wsys.doraction and not wsys.uselyre then
      wsys.timer.dowait = tempTimer(wsys.myPing()*1.5, [[wsys.timer.dowait = nil]])
      send("queue add eqbal dor")
      if wsys.timer.dorfailsafe then killTimer(wsys.timer.dorfailsafe) end
      wsys.timer.dorfailsafe = tempTimer(3.5, [[wsys.timer.dorfailsafe = nil;if wsys.bals.b and wsys.bals.e then wsys.dosend() end]])
    end
  end
end

function wsys.dosent(type)
  if type == "do" then
    raiseEvent("do action ran", wsys.doSub)
		
		if wsys.doqueue_pending and wsys.doqueue_pending.element.on_run then
			wsys.doqueue_pending.element.on_run()
		end
		
  elseif type == "dor" then
    raiseEvent("dor action ran", wsys.dorSub)
  end
	
  wsys.doqueued = false
  wsys.doqueue_pending = nil
  if wsys.timer.dowait then
    killTimer(wsys.timer.dowait)
    wsys.timer.dowait = nil
  end
  if wsys.timer.dorfailsafe then
    killTimer(wsys.timer.dorfailsafe)
    wsys.timer.dorfailsafe = nil
  end
  wsys.dosend()
end

function wsys.dolist()
        --NOTE: Feel free to pretty this up
        local color = "<white>"
        cecho(color.."[Do]: List -\n")
        if wsys.doqueue_pending then
                cecho(color.."0: ("..wsys.doqueue_pending.priority..") "..wsys.doqueue_pending.element.ac.."\n")
        end
        for i,v in pairs( wsys.doqueue ) do
                cecho(color..i..": ("..v.priority..") "..v.element.ac.."\n")
        end
end


-- remove the first element (either lifo or fifo) from the queue with priority [low, high] (inclusive)
function wsys.undo( lifo, low, high, all )
        local index = lifo and 0 or #wsys.doqueue --index to start with
        low = low or 25
 
        local valid_index = function(i) return ( i and i >= 0 and i <= #wsys.doqueue ) and i or false end
        local next_index = function(i) return lifo and valid_index(i+1) or valid_index(i-1) end
        local should_remove = function(t) return t.priority >= low and ( not high or t.priority <= high ) end
        local echo_removed = function(t) cecho("<white>[Do]: Removed ("..t.priority..") '"..t.element.ac.."' from the do queue.\n") end
       
        while valid_index(index) do
                if index == 0 then
                        --Index 0 indicates a command we already queued. Only try to remove it if we don't have bal and eq
                        if wsys.doqueue_pending and not (wsys.bals.b and wsys.bals.e ) and should_remove( wsys.doqueue_pending ) then
                                echo_removed( wsys.doqueue_pending )
                                send("clearqueue eqbal", false)
                                wsys.doqueue_pending = nil
                                if not all then
                                        --Make sure the next command gets queued
                                        wsys.dosent("do")
                                        return true
                                end
                        else
                                index = next_index( index )
                        end
                elseif wsys.doqueue[index] and should_remove( wsys.doqueue[index] ) then
                        echo_removed( wsys.doqueue[index] )
                        table.remove( wsys.doqueue, index )
                        if not all then
                                return true
                        elseif not lifo then
                                index = index - 1
                        end
                else
                        index = next_index( index )
                end
        end
        if #wsys.doqueue == 0 then
                cecho("<white>[Do]: The do queue is empty.\n")
        end
        return false
end

function wsys.undoall( lifo, low, high )
	wsys.undo( lifo, low, high, true )
end

--registerAnonymousEventHandler("lost balance", "wsys.dosent")
--registerAnonymousEventHandler("lost equilibrium", "wsys.dosent")

function wsys.dofailsafes()
  wsys.doqueued = false
  wsys.dofreeclear()
end

registerAnonymousEventHandler("got balance", "wsys.dofailsafes")
registerAnonymousEventHandler("got equilibrium", "wsys.dofailsafes")

--dor
function wsys.doradd(a)
  wsys.doraction = a
  send("setalias dor "..wsys.doraction, false)
  wsys.dosend()
end


function wsys.dorclear()
  wsys.doraction = false
  send("clearqueue eqbal", false)
  wsys.report("<green>Cleared the dorepeat queue.")
end
