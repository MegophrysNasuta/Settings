-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.syspause()
   if svo then 
      if svo.affl.retardation then 
         return true
      else
         return false
      end
   elseif wsys then
      if wsys.paused or wsys.softpaused then 
         return true
      else
         return false
      end
   else
       return false
   end
end

function inretardation()
   if svo then 
      if svo.affl.retardation then 
         return true
      else
         return false
      end
   elseif wsys then
      if wsys.isslowed() then 
         return true
      else
         return false
      end
   else
       return false
   end
end

function inaeon()
   if svo then 
      if svo.affl.aeon then 
         return true
      else
         return false
      end
   elseif wsys then
      if wsys.isslowed() then 
         return true
      else
         return false
      end
   else
       return false
   end
end

function inlyre()
   if svo then
      if svo.conf.lyre then
         return true
      else
         return false
      end
   elseif wsys then
		if wsys.uselyre == true and wsys.def.lyre == true then
       	return true
		else
			return false
		end
   else 
       return false
   end
end 


