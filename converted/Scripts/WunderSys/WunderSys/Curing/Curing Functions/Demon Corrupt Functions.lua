function wsys.demonCorrupted()
  wsys.cure = "corrupt"
  wsys.promptTrigger("corrupt", function()
	wsys.cure = nil
  end)
end
