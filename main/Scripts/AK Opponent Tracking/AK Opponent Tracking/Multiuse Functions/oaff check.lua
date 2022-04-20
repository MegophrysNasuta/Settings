-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.check(what, number)
   if not number then local number = 100 end
   if table.contains(affstrack.score, what) then
      if affstrack.score[what] >= number then
         return true
      else
         return false
      end
   elseif table.contains(affstrack.venoms, what) then
      if affstrack.score[affstrack.venoms[what]] >= number then
         return true
      else
         return false
      end
   end
end
