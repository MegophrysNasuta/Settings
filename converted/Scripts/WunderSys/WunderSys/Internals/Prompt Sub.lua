function wsys.promptColorSub(tag)
  for k,v in pairs(wsys.prompttagcolors) do
    if table.contains(wsys.prompttagcolors, tag) then
      if type(wsys.prompttagcolors[tag]) == "function" then
        return "<"..wsys.prompttagcolors[tag]()..">"
      elseif type(wsys.prompttagcolors[tag]) == "string" then
        return "<"..wsys.prompttagcolors[tag]..">"
      end --if
    else
      --color not in table, hope you used a valid mudlet color
      return "<"..tag..">"
    end --if
  end --for
end
  
function wsys.promptTagSub(tag)
  local theTag = false
  local tailEnd = false
    for k,v in pairs(wsys.prompttags) do
      if string.starts(tag, k) then
        theTag = k
        --save the bit after the prompt tag
        tailEnd = string.gsub(tag, theTag, "")
      end
    end
  local th = wsys.prompttags[theTag]
  if type(th) == "function" then
    return _G["wsys"]["prompttags"][theTag]() .. tailEnd
  elseif type(th) == "string" then
    return _G["wsys"]["prompttags"][theTag] .. tailEnd
  end
end

function wsys.displayPromptString(str)
  --Split based on color tags, so we don't change the background for everything
  local last_color = nil
  local display_text = ""
  for color,text in string.gmatch( "<white>"..str, "<([A-Za-z_:]+)>([^<]*)" ) do
    if not string.match( color, "[A-Za-z_]+:[A-Za-z_]+" ) and not color_table[color] then
      -- Not a valid color, add it to the text and continue
      display_text = display_text .. "<"..color..">"..text
    else
      if not last_color then last_color = color end

      if not string.find( color, ":" ) and not string.find( last_color, ":" ) then
        display_text = "<"..last_color..">"..display_text
      end
      display_text = display_text.."<"..color..">"..text
      cecho(display_text)
      display_text = ""
      last_color = color
    end
  end
end

function wsys.displayLen( str )
	return str:gsub("<[a-zA-Z_:]+>", ""):len()
end

function wsys.promptsub()
  selectCurrentLine(); replace("");

  local promptstring = wsys.aff.blackout and wsys.settings.blackoutprompt or wsys.settings.prompt
  --sub out the # color tags
  promptstring = string.gsub(promptstring, "#([A-Za-z_:]+)", wsys.promptColorSub )
  --sub out the @ prompt tags
  promptstring = string.gsub(promptstring, "@(%w+)", wsys.promptTagSub )

  if wsys.def.lyre then promptstring = promptstring .. "<gold> L" end
  if wsys.vmode then promptstring = promptstring ..  "<MediumVioletRed> vivi" end
  if wsys.heartseedmode then promptstring = promptstring ..  "<firebrick> H<LimeGreen>Seed" end
  if wsys.bardmode then promptstring = promptstring .. "<firebrick> BARD" end

  wsys.displayPromptString( promptstring )

  local promptline2 = wsys.settings.promptline2
  if promptline2 and type(promptline2) == "string" then
    promptline2 = string.gsub(promptline2, "#([A-Za-z_:]+)", wsys.promptColorSub )
    promptline2 = string.gsub(promptline2, "@(%w+)", wsys.promptTagSub )
    if wsys.displayLen( promptline2 ) > 0 then
      wsys.displayPromptString("\n"..promptline2)
    end
  end

  previousPromptLineNumber = currentPromptLineNumber
  previousPromptLineNumberLength = currentPromptLineNumberLength
  currentPromptLineNumber = getLineNumber()
  currentPromptLineNumberLength = #(string.gsub(promptstring, "<.->", ""))
  wsys.salviaSendEcho()

end









