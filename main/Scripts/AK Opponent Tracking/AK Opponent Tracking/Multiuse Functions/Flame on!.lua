-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function ak.flameon(typer)
   if typer == "additive" and affstrack.score.dehydrate == 100 and affstrack.score.aflame + 100 < 500 then
      affstrack.score.aflame = affstrack.score.aflame + 100      
   elseif typer == "additive" and affstrack.score.dehydrate == 100 then
      affstrack.score.aflame = 500
   elseif affstrack.score.aflame < 100 then
      affstrack.score.aflame = 100
   end
   ak.scoreup(target)
end

