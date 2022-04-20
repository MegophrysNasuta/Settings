function wsys.emptywrithe()
  wsys.writhesub()
  if wsys.timer.writhewait then
   killTimer(tostring(wsys.timer.writhewait))
  end
  wsys.timer.writhewait = nil
  for k,v in pairs(wsys.tb.cures.writhe) do
    wsys.predicted[v] = nil
    if wsysf.affs[v] then
      wsysf.core.debug.print(2, "Empty writhe should clear ".. v.."?")
    end
    disableTrigger(string.title(v) .. " -")
  end -- for
  wsys.cure = nil
end -- func


function wsys.writhedimpaled()
 if not wsys.lifevision then
  if wsys.timer.writhebalimpaled then
   wsys.writhesub()
   wsys.cure = "writhe"
   killTimer(tostring(wsys.timer.writhebalimpaled))
   wsys.timer.writhebalimpaled = nil
   if wsys.aff.impaled then
     wsys.affcured("impaled")
   elseif wsys.aff.daeggerimpale then
     wsys.affcured("daeggerimpale")
   end
   wsys.cure = nil
  end -- if
 end -- if
end -- func


function wsys.writhed(what)
 if not wsys.lifevision then
  if wsys.timer.writhebal then
   --wsys.writhesub()
   wsys.cure = "writhe"
   killTimer(tostring(wsys.timer.writhebal))
   wsys.timer.writhebal = nil
   wsys.affcured(what)
   wsys.cure = nil
  end -- if
 end -- if
end -- func



function wsys.writhestart(line)
  wsys.writhesub()
  if wsys.timer.writhewait then
   killTimer(tostring(wsys.timer.writhewait))
  end
  wsys.timer.writhewait = nil
  if string.match(line, "impaled you") then
   if wsys.damagedlegs() then
    wsys.timer.writhebalimpaled = tempTimer(8, [[wsys.timer.writhebalimpaled=nil]])
   else
    wsys.timer.writhebalimpaled = tempTimer(4, [[wsys.timer.writhebalimpaled=nil]])
   end -- if
  else
   wsys.timer.writhebal = tempTimer(5, [[wsys.timer.writhebal=nil]])
  end -- if
end -- func


function wsys.writhing()
 if wsys.timer.writhebal then
  wsys.writhesub()
  killTimer(tostring(wsys.timer.writhebal))
  wsys.timer.writhebal = tempTimer(4, [[wsys.timer.writhebal=nil]])
 end -- func
end-- func
