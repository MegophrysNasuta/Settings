


-- ALERTNESS
local exits = exits or {}
function wsys.AlertnessMatch(person, room)
  if exits[room]~=nil then
   cecho('\n<red>[<white>'..person..'<red> - <white>'..exits[room].. '<white> - <blue>' .. room .. '<red>]')
  else
   if room == gmcp.Room.Info.name then
    cecho('\n<red>[<white>'..person..'<red> - here<red>]')
   else
    cecho('\n<red>[<white>'..person..'<blue> - ' .. room .. '<red>]')
   end
  end -- if
end -- func


-- AFF CURE PRINT
function wsys.affcureprint(affliction)
 if wsys.settings.affcuredechos then
  deleteLine()
  cinsertText("\n[<medium_sea_green>CURED<grey>]<LawnGreen> " .. affliction:upper() .. " <grey>| <medium_sea_green>" .. line)
 end
end -- func

wsys.affs_gained = wsys.affs_gained or {}
-- AFF PRINT
function wsys.affprint(affliction, affline)
  if wsys.settings.affgainedechos then
    if affline then
     deleteLine()
     cinsertText("\n[<firebrick>AFF<grey>]<red> " .. affliction:upper() .. " <grey>| <firebrick>" .. affline .. "\nYour <yellow>" .. affliction:upper() .. "<firebrick> broke, <yellow>" .. affliction:upper() .. "<firebrick> broke!\n")
    else
     if not wsys.aff[affliction] or wsys.affs_gained[affliction] then
      deleteLine()
      cinsertText("\n[<firebrick>AFF<grey>]<red> " .. affliction:upper() .. " <grey>| <firebrick>" .. line)
      wsys.affs_gained[affliction] = nil
     else
      selectCurrentLine()
      fg("firebrick")
      deselect()
      resetFormat()
     end -- if
    end -- if 
  end
end -- func

-- AEON ACTION PRINT
function wsys.aeoncolour()
  selectCurrentLine()
  fg("purple")
  deselect()
  resetFormat()
end -- func


-- ATE SUB
local herbcolours = {
 bloodroot = "light_coral",
 magnesium = "light_coral",
 kelp = "ForestGreen",
 aurum = "ForestGreen",
 goldenseal = "goldenrod",
 plumbum = "goldenrod",
}

function wsys.atesub(herb)
 selectCurrentLine()
 if herbcolours[herb] then
   fg(herbcolours[herb])
 else
   fg("cadet_blue")
 end -- if
 deselect()
 resetFormat()
-- deleteLine()
-- if herbcolours[herb] then
--  cinsertText("\n[ <SeaGreen>ATE <grey>] <" .. herbcolours[herb] .. ">" .. herb:upper() .. " <grey>| " .. line)
-- else
--  cinsertText("\n[ <SeaGreen>ATE <grey>] <SaddleBrown>" .. herb:upper() .. " <grey>| " .. line)
-- end -- if
end -- func 

-- SALVE SUB
function wsys.salvesub(salve)
 selectCurrentLine()
 if string.match(salve, "restoration") then
  fg("yellow")
 else
  fg("wheat")
 end -- if
 deselect()
 resetFormat()
-- deleteLine()
-- if string.match(salve, "restoration") then
--  cinsertText("\n[<SeaGreen>SALVE<grey>] <yellow>" .. salve:upper() .. " <grey>| " .. line)
-- else
--  cinsertText("\n[<SeaGreen>SALVE<grey>] <dark_goldenrod>" .. salve:upper() .. " <grey>| " .. line)
-- end -- if
end -- func 


-- SMOKE SUB
function wsys.smokesub(pipe)
 selectCurrentLine()
 fg("olive_drab")
 deselect()
 resetFormat()
 cecho(" " .. pipe:title() .. " puffs remaining: " .. wsys.pipes[pipe .. "puffs"])

-- deleteLine()
-- cinsertText("\n[<SeaGreen>SMOKED<grey>] <olive_drab>" .. pipe:upper() .. " <grey>| " .. line)
end -- func 


-- TREE SUB
function wsys.treesub()
 deleteLine()
 cinsertText("\n<dark_green>[<green>TREE<dark_green>] <grey>" .. line)
end -- func


-- FOCUS SUB
function wsys.focussub()
 selectCurrentLine()
 fg("dark_goldenrod")
 deselect()
 resetFormat()
-- deleteLine()
-- cinsertText("\n[<SeaGreen>FOCUSED<grey>] <grey>| " .. line)
end -- func


-- RESTORE SUB
function wsys.restoresub()
 deleteLine()
 cinsertText("\n[<orange_red>RESTORED<grey>] | <orange_red>" .. line)
end -- func


-- DHEAL SUB
function wsys.dhealsub()
 deleteLine()
 cinsertText("\n[<MediumSpringGreen>DHEALED<grey>] | <MediumSpringGreen>" .. line)
end -- func


-- FLEX SUB
function wsys.flexsub()
 deleteLine()
 cinsertText("\n[<medium_turquoise>FLEXED<grey>] | <medium_turquoise>" .. line)
end -- func


-- WRITHE SUB
function wsys.writhesub()
 deleteLine()
 cinsertText("\n[<medium_turquoise>WRITHE<grey>] | <medium_turquoise>" .. line)
end -- func


-- WAKING SUB
function wsys.wakesub()
 selectCurrentLine()
 fg("dark_turquoise")
 deselect()
 resetFormat()
 cecho("\n<dark_turquoise>WAKING <white>- <dark_turquoise>WAKING <white>- <dark_turquoise>WAKING\n")
end -- func


-- HMBAL SUB
function wsys.hmbalsub()
 selectCurrentLine()
 fg("MediumAquamarine")
 deselect()
 resetFormat()
end -- func


-- MOSS BAL SUB
function wsys.mossbalsub()
 selectCurrentLine()
 fg("pale_violet_red")
 deselect()
 resetFormat()
end -- func



-- HERB BAL SUB
function wsys.herbbalsub()
 selectCurrentLine()
 fg("light_slate_blue")
 deselect()
 resetFormat()
end -- func

-- SALVE BAL SUB
function wsys.salvebalsub()
 selectCurrentLine()
 fg("rosy_brown")
 deselect()
 resetFormat()
end -- func

-- FOCUS BAL SUB
function wsys.focusbalsub()
 selectCurrentLine()
 fg("NavajoWhite")
 deselect()
 resetFormat()
end -- func
