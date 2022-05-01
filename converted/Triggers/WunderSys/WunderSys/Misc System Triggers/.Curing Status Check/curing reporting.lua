if wsys.curingstatuscheck then deleteLine() end
if matches[2] == "No" then
  send("curing reporting on", false)
  wsys.report("Curing Reporting must stay on!")
  wsys.report("If you wish to gag it please use <green>wconfig curingreportinggag true")
end


