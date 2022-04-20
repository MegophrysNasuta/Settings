if ak.refreshAffs then return end           --DELETE THIS SHIT OUT OF YOUR PERSONAL VARS
ak = ak or {}

function ak.refreshAffs()
   if GUI and GUI.ak then
      GUI.ak()                              
   else
      ak.refreshAffsOLD()
   end

end

function ak.refreshAffsOLD()                               --This is my standard display included
        WindowWidth = 0;
        WindowHeight = 0;
        WindowWidth, WindowHeight = getMainWindowSize()
        moveWindow("aff_display", WindowWidth-190,WindowHeight-900)
        resizeWindow("aff_display", 175,890)
        clearWindow("aff_display")
        if ak.defs.rebounding then         
					cecho("aff_display","\nRebounding: <red>YES!\n")
        else 
					cecho("aff_display","\nRebounding: <yellow>NONE!\n")
        end
        if ak.defs.shield then 
        	cecho("aff_display","\nShielding: <red>YES!\n")
        else 
					cecho("aff_display","\nShielding: <yellow>NONE!\n")
        end
        if ak.defs.curseward then 
        	cecho("aff_display","\nWarding: <red>YES!\n")
        else 
					cecho("aff_display","\nWarding: <yellow>NONE!\n")
        end
        if swiftcount then 
             if swiftcount == 1 then 
                  cecho("aff_display","\nSwifting: <red>FALLING!\n\n")
             else 
                  cecho("aff_display","\nSwifting: <yellow>"..swiftcount.."!\n\n")
             end 
        end
        if vodun and vodun[target] and vodun[target]["fashions"] ~= nil then
           cecho("aff_display","0Fashions:<orange_red>"..vodun[target]["fashions"].."\n\n")
        end
        if ak.stack then echo("aff_display","Stacking:"..ak.stack.."\n") else echo("aff_display","\nStacking: NONE!\n\n") end
        targetrelay()
        echo("aff_display","\n0Afflictions:       \n\n")
        for k,v in pairs(affstrack.score) do
        if v > 1 then
           echo("aff_display", k.." "..v.."\n")
           end
        end
        if affstrack.kelpscore > .1 then    echo("aff_display","\nKelp:        "..affstrack.kelpscore.."|4\n") end
        if affstrack.ginsengscore > .1 then echo("aff_display","Ginseng:     "..affstrack.ginsengscore.."|5\n") end
        if affstrack.goldenscore > .1 then  echo("aff_display","Goldenseal:  "..affstrack.goldenscore.."|5\n") end
        if affstrack.mentalscore > .1 then  echo("aff_display","Mentals:  "..affstrack.mentalscore.."|4\n") end
        if softscore then if softscore >= 3 then cecho("aff_display", "Locks:\n SOFT LOCKED!") end end
        if truescore then if truescore >= 5 then cecho("aff_display", "TRUE LOCKED!") end end
        ak.limbshow()
end

function ak.noDisplay()
        WindowWidth = 0;
        WindowHeight = 0;
        WindowWidth, WindowHeight = getMainWindowSize()
        moveWindow("aff_display", 0,0)
        resizeWindow("aff_display", 0,0)
        clearWindow("aff_display")
end


function init()
        winX, winY = getMainWindowSize()
        createMiniConsole("aff_display", winX-145,0,130,400)
        setBackgroundColor("aff_display", 150, 150, 150, 255)
        setMiniConsoleFontSize( "aff_display", 10 )
        setFgColor("aff_display", 10, 0, 0)
        setBgColor("aff_display", 150, 150, 150)
--ak.refreshAffs()
end



