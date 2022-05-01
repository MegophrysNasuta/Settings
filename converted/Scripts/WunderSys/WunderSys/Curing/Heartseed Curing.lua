wsys.heartseedmode = false
local heartseedjuke = heartseedjuke or false

function wsys.hseedIgnoreResto(event, affliction, class)
  if event == "got aff" and wsys.heartseedmode then
    if affliction == "damagedleftleg" or affliction == "damagedrightleg" or affliction == "damagedleftarm" or affliction == "damagedrightarm" then
      wsys.switchPrios( "damagedleftleg", 26 )
      wsys.switchPrios( "damagedrightleg", 26 )
      wsys.switchPrios( "mangledleftleg", 26 )
      wsys.switchPrios( "mangledrightleg", 26 )
      wsys.switchPrios( "damagedleftarm", 26 )
      wsys.switchPrios( "damagedrightarm", 26 )
      wsys.switchPrios( "mangledleftarm", 26 )
      wsys.switchPrios( "mangledrightarm", 26 )
    end
  end
end

registerAnonymousEventHandler("got aff", "wsys.hseedIgnoreResto")

function wsys.heartseedMendingCured(event, affliction)
  if event == "lost aff" and wsys.heartseedmode then
    if affliction == "brokenleftleg" or affliction == "brokenrightleg" or affliction == "brokenleftarm" or affliction == "brokenrightleg" then
      heartseedjuke = true
      if wsys.timer.heartseedjuketimer then killTimer(tostring(wsys.timer.heartseedjuketimer)) end
      wsys.timer.heartseedjuketimer = tempTimer(2, [[heartseedjuke = false;wsys.timer.heartseedjuketimer = nil]])
    end
  end
end

registerAnonymousEventHandler("lost aff", "wsys.heartseedMendingCured")

--will fake apply to a leg to bait the heartseed
function wsys.jukeApply(event, bal)
  if event == "got bal" and bal == "salve" and wsys.heartseedmode and heartseedjuke then
   if not wsys.aff.heartseed then
    if (wsys.aff.damagedleftleg or wsys.aff.damagedrightleg) then
      send("apply mending to legs")
    elseif (wsys.aff.damagedleftarm or wsys.aff.damagedrightarm) then
      send("apply mending to arms")
    end
   end
   heartseedjuke = false
  end
end

registerAnonymousEventHandler("got bal", "wsys.jukeApply")


--turn on leg curing again
function wsys.heartseedGone(event, aff)
  if event == "lost aff" and aff == "heartseed" then
    if wsys.heartseedmode and (wsys.aff.damagedleftleg or wsys.aff.damagedrightleg) then
      wsys.affPrioRestore( "damagedleftleg" )
      wsys.affPrioRestore( "damagedrightleg" )
      wsys.affPrioRestore( "mangledleftleg" )
      wsys.affPrioRestore( "mangledrightleg" )
      wsys.affPrioRestore( "damagedleftarm" )
      wsys.affPrioRestore( "damagedrightarm" )
      wsys.affPrioRestore( "mangledleftarm" )
      wsys.affPrioRestore( "mangledrightarm" )
    end
  end
end

registerAnonymousEventHandler("lost aff", "wsys.heartseedGone")

function wsys.thornrended(event, limb, attack)
  if event == "myLimbHit" and attack == "thornrend" then
    if wsys.heartseedmode and (wsys.aff.damagedleftleg or wsys.aff.damagedrightleg) then
      wsys.affPrioRestore( "damagedleftleg" )
      wsys.affPrioRestore( "damagedrightleg" )
      wsys.affPrioRestore( "mangledleftleg" )
      wsys.affPrioRestore( "mangledrightleg" )
      wsys.affPrioRestore( "damagedleftarm" )
      wsys.affPrioRestore( "damagedrightarm" )
      wsys.affPrioRestore( "mangledleftarm" )
      wsys.affPrioRestore( "mangledrightarm" )
    end
  end
end

registerAnonymousEventHandler("myLimbHit", "wsys.thornrended")
