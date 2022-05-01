--Sylvans use 'cast barkskin', Sentinels just do 'barkskin'.
function wsys.manualbarkskin()
  if wsys.myClass() == "Sylvan" then
    return "cast barkskin"
  elseif wsys.myClass() == "Sentinel" then
    return "barkskin"
  end
end

function wsys.metaform(form)
  if ( wsys.myClass() == "sentinel" or wsys.myClass() == "druid" )  then
    wsys.morphing = true
    return("belch;morph "..form)
  end
end
