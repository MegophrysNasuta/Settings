-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.dragon.default.dragoncurser() 
      if math.random(100)<50 then
         if affstrack.score.paralysis<100 and vcombo[1] ~= "curare" then
            dragoncurse = "paralysis"
         elseif affstrack.score.asthma<100 and vcombo[1] ~= "kalmia" then
            dragoncurse = "asthma"
         elseif affstrack.score.sensitivity<100 then
            dragoncurse = "sensitivity"
         elseif affstrack.score.impatience<100 then
            dragoncurse = "impatience"
         end
      else
         if affstrack.score.asthma<100 and vcombo[1] ~= "kalmia"  then
            dragoncurse = "asthma"
         elseif affstrack.score.impatience<100 then
            dragoncurse = "impatience"
         elseif affstrack.score.sensitivity<100 then
            dragoncurse = "stupidity"
         elseif affstrack.score.paralysis<100 and vcombo[1] ~= "curare"  then
            dragoncurse = "paralysis"
         end
    
      end
   if affstrack.score.sensitivity<100 and vcombo[1] == "prefarar" and affstrack.score.blind ~= 100 then dragoncurse = "sensitivity" end
end

