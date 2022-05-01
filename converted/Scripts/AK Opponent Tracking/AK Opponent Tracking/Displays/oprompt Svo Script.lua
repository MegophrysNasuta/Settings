--svo prompt
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
--Mine Below!
--Without The Display!
--vconfig customprompt ^1H: @health ^W(^1@%health%^W), ^2M: @mana ^W(^2@%mana%^W) ^4@willpowerw, ^5@endurancee ^W@%xp% @eqbal|@defs@affs^W @ml_prompttagmine[@gametargethp]-
--With The Display!
--vconfig customprompt ^1H: @health ^W(^1@%health%^W), ^2M: @mana ^W(^2@%mana%^W) ^4@willpowerw, ^5@endurancee ^W@%xp% @eqbal|@defs@affs^W @ml_prompttagmine[@gametargethp]^y@ml_oprompt-

--Add @ml_oprompt to your custom svo prompt
--Use ^y@ml_oprompt instead for it to be coloured yellow


function ak.ml_oprompt()
  promptset = promptset or {}
  if not target then 
     return "" 
  elseif #promptset > 0 then
     return ("["..table.concat(promptset, ", ").."]")
  else
     return ""
  end
end

function ak.svoEventHandlers()
   svo.adddefinition("@ml_oprompt", "ak.ml_oprompt()")
end
 
registerAnonymousEventHandler("svo system loaded", "ak.svoEventHandlers")



