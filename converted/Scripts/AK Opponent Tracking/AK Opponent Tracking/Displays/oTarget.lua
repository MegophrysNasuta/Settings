-------------------------------------------------
--         Put your Lua functions here.        --
--                                             --
-- Note that you can also use external Scripts --
-------------------------------------------------
function targetrelay ()
				if not target then return end
        cecho("aff_display","\n<blue>****************\n")
        cecho("aff_display","\n0Targets: "..target.."\n\n")
        if target1 ~= nil then cecho("aff_display","\nTarget1:<yellow> "..target1.."\n\n") end
        if target2 ~= nil then cecho("aff_display","Target2:<yellow> "..target2.."\n\n") end
        if target3 ~= nil then cecho("aff_display","Target3:<yellow> "..target3.."\n\n") end
        cecho("aff_display","\n<blue>****************\n")
end
