-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.dragon.default.setalias() 
	ak.setalias("oattackrl", PreAliasGeneral().."/wield shield/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." right leg "..vcombo[1].."/breathgust "..target)
	ak.setalias("oattackll", PreAliasGeneral().."/wield shield/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." left leg "..vcombo[1].."/breathgust "..target)
	ak.setalias("oattackra", PreAliasGeneral().."/wield shield/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." right arm "..vcombo[1].."/breathgust "..target)
	ak.setalias("oattackla", PreAliasGeneral().."/wield shield/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." left arm "..vcombo[1].."/breathgust "..target)
	ak.setalias("oattackt", PreAliasGeneral().."/wield shield/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." torso "..vcombo[1].."/breathgust "..target)
	ak.setalias("oattackh", PreAliasGeneral().."/wield shield dirk/dragoncurse "..target.." "..dragoncurse.." 1/rend "..target.." head "..vcombo[1].."/breathgust "..target)
end
