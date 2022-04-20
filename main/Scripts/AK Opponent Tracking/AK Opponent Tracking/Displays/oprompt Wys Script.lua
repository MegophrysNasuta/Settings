--wsys.prompt
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
--type wshow display
--add @owysprompt into your prompt

function wsys.prompttags.owysprompt()
  promptset = promptset or {}
  if not target then 
     return "" 
  elseif #promptset > 0 and not ak.disableAllEchos then
     return (ak.prompt.default.."["..table.concat(promptset, ", ").."<yellow>]")
  else
     return ""
  end
end
                    




