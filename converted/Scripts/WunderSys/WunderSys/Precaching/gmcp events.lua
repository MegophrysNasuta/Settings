function wsys.addedItem()
  if gmcp.Char.Items.Add.location == "inv" then
    local herbName = wsys.returnHerbName(gmcp.Char.Items.Add.item.name)
    --cecho("<green>Added:")
    --display(gmcp.Char.Items.Add)
    
    --if item is a herb find amount of herbs
    if herbName then
      local herbAmount = wsys.extractNumberFromString(gmcp.Char.Items.Add.item.name) or 1
      --add amount to herbs already outrifted
      wsys.herbsout[herbName] = wsys.herbsout[herbName] + herbAmount

      --save the wsys.addedHerbID for a special gmcp case
      wsys.addedHerbID = tonumber(gmcp.Char.Items.Add.item.id)
      
      if wsys.timer.outrqueuewait then killTimer(wsys.timer.outrqueuewait) end
      wsys.timer.outrqueuewait = tempTimer(wsys.myPing() * 1.5, [[wsys.timer.outrqueuewait = nil;wsys.outrqueue()]])
    end
  end
end --func

registerAnonymousEventHandler("gmcp.Char.Items.Add", "wsys.addedItem")

function wsys.removedItem()
  if gmcp.Char.Items.Remove.location == "inv" then
    local herbName = wsys.returnHerbName(gmcp.Char.Items.Remove.item.name)
    --cecho("<red>Removed:")
    --display(gmcp.Char.Items.Remove)
    
    --if the item is a herb find amount
    if herbName then
      local herbAmount = wsys.extractNumberFromString(gmcp.Char.Items.Remove.item.name) or 1
      --remove amount from herbs already outrifted
      wsys.herbsout[herbName] = wsys.herbsout[herbName] - herbAmount

      --save the wsys.removedHerbID for a special gmcp case
      wsys.removedHerbID = tonumber(gmcp.Char.Items.Remove.item.id)

      --check if you ate from a group of herbs, causing an added and removed event
      if wsys.removedHerbID == wsys.addedHerbID then
        --it is the case, remove the extra added
        wsys.herbsout[herbName] = wsys.herbsout[herbName] - 1

        --change the addedHerbID just in case
        wsys.addedHerbID = 1
      end

      --make sure you didn't subtract too many and end up with negative values in wsys.herbsout
      if wsys.herbsout[herbName] < 0 then
        wsys.herbsout[herbName] = 0
      end
      if not wsys.timer.outrqueuewait then wsys.outrqueue() end
    end
  end
end

registerAnonymousEventHandler("gmcp.Char.Items.Remove", "wsys.removedItem")

function wsys.updateItem()
  if gmcp.Char.Items.Update.location == "inv" then
    --cecho("<green>Updated:")
    --display(gmcp.Char.Items.Update)
  end
end

registerAnonymousEventHandler("gmcp.Char.Items.Update", "wsys.updateItem")
