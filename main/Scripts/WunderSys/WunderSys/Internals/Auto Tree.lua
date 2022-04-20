-- basically a script that tracks if you're auto treeing or not. Can toggle for you.

function wsys.toggleAutoTree()
  if wsys.settings.autotree then
    wsys.autoTreeOff()
  else
    wsys.autoTreeOn()
  end
end

function wsys.autoTreeOn()
  wsys.settings.autotree = true
  send("curing tree on", false)
  wsys.report("Auto tree usage on")
end

function wsys.autoTreeOff()
  wsys.settings.autotree = false
  send("curing tree off", false)
  wsys.report("Auto tree usage off")
end
