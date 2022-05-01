-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.staffaff(staffhit)
  if staffhit == "airstaff" then
	   OppGainedAff("prone")
  elseif staffhit == "firestaff" then
	   ak.flameon("notadditive")
  --elseif staffhit == "earthstaff" then
	   --OppGainedAff("prone")
  elseif staffhit == "waterstaff" then
	   OppGainedAff("frozen")
  end
end

--DO NOT MESS WITH THIS--
