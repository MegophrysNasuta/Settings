function wsys.humourGainedHandling(event, affliction, class)
  if event == "got aff" then
    --any of the tempered humours
      if wsys.aff.temperedcholeric and wsys.aff.temperedcholeric >= 4 then
        wsys.switchPrios("temperedcholeric", 2 )
        --prio sensi here at 3 or something
      elseif wsys.aff.temperedsanguine and wsys.aff.temperedsanguine >= 4 then
        wsys.switchPrios("temperedsanguine", 2 )
      elseif wsys.aff.temperedphlegmatic and wsys.aff.temperedphlegmatic >= 4 then
        --wsys.switchPrios("temperedphlegmatic", 2 )
      elseif wsys.aff.temperedmelancholic and wsys.aff.temperedmelancholic >= 4 then
        wsys.switchPrios("temperedmelancholic", 2 )
      end
    end
end --func

registerAnonymousEventHandler("got aff", "wsys.humourGainedHandling")

function wsys.humourLevelLost()
    if wsys.aff.temperedcholeric and wsys.aff.temperedcholeric <= 2 then
        wsys.affPrioRestore("temperedcholeric")
        --prio sensi here at 3 or something
      elseif wsys.aff.temperedsanguine and wsys.aff.temperedsanguine <= 1 then
        wsys.affPrioRestore("temperedsanguine" )
      elseif wsys.aff.temperedphlegmatic and wsys.aff.temperedphlegmatic <= 2  then
        wsys.affPrioRestore("temperedphlegmatic" )
      elseif wsys.aff.temperedmelancholic and wsys.aff.temperedmelancholic <= 2 then
        wsys.affPrioRestore("temperedmelancholic" )
      end
end --func

function wsys.humourcured(event, affliction)
  if event == "lost aff" then
    if affliction == "temperedcholeric" or (wsys.affPosition("temperedcholeric") ~= wsys.defaultAffPosition("temperedcholeric")) then
      wsys.affPrioRestore("temperedcholeric")
    elseif affliction == "temperedsanguine" or (wsys.affPosition("temperedsanguine") ~= wsys.defaultAffPosition("temperedsanguine")) then
      wsys.affPrioRestore("temperedsanguine")
    elseif affliction == "temperedphlegmatic" or (wsys.affPosition("temperedphlegmatic") ~= wsys.defaultAffPosition("temperedphlegmatic")) then
      wsys.affPrioRestore("temperedphlegmatic")
    elseif affliction == "temperedmelancholic" or (wsys.affPosition("temperedmelancholic") ~= wsys.defaultAffPosition("temperedmelancholic")) then
      wsys.affPrioRestore("temperedmelancholic")
    end
  end
end

registerAnonymousEventHandler("lost aff", "wsys.humourcured")
