if matches[2] == "settings" then
  wsys.displaySettings()
elseif matches[2] == "display" then
  wsys.displayEchosAndGags()
elseif matches[2] == "defup" then
  wsys.showDefMenu("defup", wsys.profile ,wsys.myClass())
elseif matches[2] == "keepup" then
  wsys.showDefMenu("keepup", wsys.profile ,wsys.myClass())
elseif matches[2] == "convenience" then
  wsys.displayConvenience()
elseif matches[2] == "defprio" then
  wsys.defprioDisplay()
elseif matches[2] == "precache" then
  wsys.precachedisplay()
elseif matches[2] == "focusshift" or matches[2] == "focusshifts" then
 wsys.focusshiftsdisplay()
elseif matches[2] == "affprio" then
 wsys.affpriodisplay("all")
end

