function wsys.concentrated()
  wsys.cure = "concentrate"
  wsys.affcured("disrupted")
  wsys.cure = nil
end -- func

function wsys.concentrate()
  send("curing queue add concentrate")
end
