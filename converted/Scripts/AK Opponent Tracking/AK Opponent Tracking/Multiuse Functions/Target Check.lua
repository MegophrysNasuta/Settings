--Targetted Script
-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function IsTargetted(person)
   if not person then return end
   target = target or "Austere"
   if person == target then 
     return true
   elseif string.starts(person, target) then
      return true
   else
      return false
   end
end
