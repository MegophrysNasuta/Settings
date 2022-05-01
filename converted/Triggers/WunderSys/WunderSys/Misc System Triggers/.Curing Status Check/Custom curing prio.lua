if wsys.curingstatuscheck then deleteLine() end
if matches[2] == "No" then
  wsys.report("Stock Serverside Curing detected. Resetting to your default prio.")
  wsys.resetAffPrios()
end
